// services/chat_service.dart - إصدار محسن
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:signalr_core/signalr_core.dart';

// نموذج الرسالة
class ChatMessage {
  final int id;
  final String senderId;
  final String senderName;
  final String type;
  final String? text;
  final DateTime sentAt;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.type,
    this.text,
    required this.sentAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      senderName: json['senderName'] ?? '',
      type: json['type'],
      text: json['text'],
      sentAt: DateTime.parse(json['sentAt']),
    );
  }

  bool get isTextMessage => type == 'Text';
}

// المتحكم الرئيسي
class ChatController extends GetxController {
  HubConnection? _hubConnection;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  static const int maxReconnectAttempts = 5;
  
  // المتغيرات التفاعلية
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isConnecting = true.obs;
  final RxBool isConnected = false.obs;
  final RxString connectionError = ''.obs;
  final RxString connectionStatus = 'جارٍ الاتصال...'.obs;
  
  // المعاملات المطلوبة
  late String jwtToken;
  late int subscriptionId;
  late String currentUserId;
  late String currentUserName;

  // تهيئة الاتصال
  void initialize({
    required String token,
    required int subId,
    String? userId,
    String? userName,
  }) {
    jwtToken = token;
    subscriptionId = subId;
    
    // إذا لم يتم تمرير userId، استخرجه من JWT
    if (userId != null) {
      currentUserId = userId;
      currentUserName = userName ?? '';
    } else {
      final userInfo = _extractUserInfoFromJWT(token);
      currentUserId = userInfo['userId'] ?? '';
      currentUserName = userInfo['userName'] ?? '';
    }
    
    _connectToHub();
  }

  // التحقق من صحة JWT Token
  bool _isTokenValid(String token) {
    try {
      final cleanToken = token.replaceFirst('Bearer ', '');
      final parts = cleanToken.split('.');
      if (parts.length != 3) return false;
      
      String payload = parts[1];
      switch (payload.length % 4) {
        case 0: break;
        case 2: payload += '=='; break;
        case 3: payload += '='; break;
        default: return false;
      }
      
      final decoded = utf8.decode(base64Url.decode(payload));
      final Map<String, dynamic> claims = json.decode(decoded);
      
      // التحقق من انتهاء الصلاحية
      if (claims.containsKey('exp')) {
        final exp = claims['exp'] as int;
        final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
        if (DateTime.now().isAfter(expiry)) {
          return false; // Token منتهي الصلاحية
        }
      }
      
      return true;
    } catch (e) {
      print('Error validating token: $e');
      return false;
    }
  }

  // استخراج معلومات المستخدم من JWT Token
  Map<String, String> _extractUserInfoFromJWT(String token) {
    try {
      final cleanToken = token.replaceFirst('Bearer ', '');
      final parts = cleanToken.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid JWT format');
      }
      
      String payload = parts[1];
      switch (payload.length % 4) {
        case 0: break;
        case 2: payload += '=='; break;
        case 3: payload += '='; break;
        default: throw Exception('Invalid base64 string');
      }
      
      final decoded = utf8.decode(base64Url.decode(payload));
      final Map<String, dynamic> claims = json.decode(decoded);
      
      return {
        'userId': claims['uid'] ?? claims['sub'] ?? claims['user_id'] ?? claims['id'] ?? '',
        'userName': claims['unique_name'] ?? claims['name'] ?? claims['username'] ?? '',
      };
    } catch (e) {
      print('Error extracting user info from JWT: $e');
      return {'userId': '', 'userName': ''};
    }
  }

  // الاتصال بـ SignalR Hub
  Future<void> _connectToHub() async {
    try {
      isConnecting.value = true;
      connectionError.value = '';
      connectionStatus.value = 'جارٍ الاتصال...';
      
      // التحقق من صحة التوكن قبل الاتصال
      if (!_isTokenValid(jwtToken)) {
        throw Exception('JWT Token غير صحيح أو منتهي الصلاحية');
      }
      
      // إغلاق الاتصال السابق إن وجد
      if (_hubConnection != null) {
        await _hubConnection!.stop();
      }
      
      // إنشاء الاتصال مع إعدادات محسنة
      _hubConnection = HubConnectionBuilder()
          .withUrl(
            'https://coachingfit.somee.com/hubs/chat',
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(jwtToken),
              transport: HttpTransportType.webSockets,
              skipNegotiation: false,
              logMessageContent: true,
            ),
          )
          .withAutomaticReconnect([0, 2000, 10000, 30000]) // إعادة اتصال تلقائي
          .build();

      // معالجة أحداث الاتصال
      _hubConnection!.onclose((error) {
        print('Connection closed: $error');
        isConnected.value = false;
        connectionStatus.value = 'الاتصال مقطوع';
        if (error != null) {
          _handleConnectionError(error);
        }
      });

      _hubConnection!.onreconnecting((error) {
        print('Reconnecting: $error');
        isConnected.value = false;
        connectionStatus.value = 'جارٍ إعادة الاتصال...';
      });

      _hubConnection!.onreconnected((connectionId) {
        print('Reconnected: $connectionId');
        isConnected.value = true;
        connectionStatus.value = 'متصل';
        connectionError.value = '';
        _reconnectAttempts = 0;
        // إعادة تحميل التاريخ بعد إعادة الاتصال
        _hubConnection?.invoke('LoadHistory', args: [subscriptionId]);
      });

      // ربط استلام الرسائل الجديدة
      _hubConnection?.on('ReceiveMessage', (arguments) {
        if (arguments != null && arguments.isNotEmpty) {
          try {
            final messageData = arguments[0] as Map<String, dynamic>;
            final message = ChatMessage.fromJson(messageData);
            messages.add(message);
            _scrollToBottom();
          } catch (e) {
            print('Error parsing received message: $e');
          }
        }
      });

      // ربط استلام تاريخ المحادثة
      _hubConnection?.on('History', (arguments) {
        if (arguments != null && arguments.isNotEmpty) {
          try {
            final historyData = arguments[0] as List<dynamic>;
            final historyMessages = historyData
                .map((data) => ChatMessage.fromJson(data as Map<String, dynamic>))
                .toList();
            messages.clear();
            messages.addAll(historyMessages);
            _scrollToBottom();
          } catch (e) {
            print('Error parsing history: $e');
          }
        }
      });

      // بدء الاتصال
      await _hubConnection!.start();
      
      // التحقق من حالة الاتصال
      if (_hubConnection!.state == HubConnectionState.connected) {
        // تحميل تاريخ المحادثة
        await _hubConnection?.invoke('LoadHistory', args: [subscriptionId]);
        
        isConnected.value = true;
        connectionStatus.value = 'متصل';
        _reconnectAttempts = 0;
      } else {
        throw Exception('فشل في إنشاء الاتصال');
      }
      
      isConnecting.value = false;
      
    } catch (e) {
      print('Connection error: $e');
      isConnecting.value = false;
      isConnected.value = false;
      _handleConnectionError(e);
    }
  }

  // معالجة أخطاء الاتصال
  void _handleConnectionError(dynamic error) {
    String errorMessage = '';
    
    if (error.toString().contains('1002')) {
      errorMessage = 'خطأ في البروتوكول - يرجى التحقق من التوكن';
    } else if (error.toString().contains('1006')) {
      errorMessage = 'انقطع الاتصال بشكل غير طبيعي';
    } else if (error.toString().contains('timeout') || error.toString().contains('TimeoutException')) {
      errorMessage = 'انتهت مهلة الاتصال - تحقق من الإنترنت';
    } else if (error.toString().contains('401') || error.toString().contains('Unauthorized')) {
      errorMessage = 'غير مخول - يرجى تسجيل الدخول مرة أخرى';
    } else if (error.toString().contains('404')) {
      errorMessage = 'الخادم غير متاح';
    } else {
      errorMessage = 'فشل في الاتصال: ${error.toString()}';
    }
    
    connectionError.value = errorMessage;
    connectionStatus.value = 'خطأ في الاتصال';
    
    // محاولة إعادة الاتصال التلقائي
    if (_reconnectAttempts < maxReconnectAttempts) {
      _scheduleReconnect();
    }
  }

  // جدولة إعادة الاتصال
  void _scheduleReconnect() {
    _reconnectAttempts++;
    final delay = Duration(seconds: _reconnectAttempts * 2); // تأخير متزايد
    
    connectionStatus.value = 'إعادة المحاولة خلال ${delay.inSeconds} ثانية...';
    
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(delay, () {
      if (_reconnectAttempts <= maxReconnectAttempts) {
        _connectToHub();
      }
    });
  }

  // إرسال رسالة
  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isNotEmpty && _hubConnection?.state == HubConnectionState.connected) {
      try {
        await _hubConnection?.invoke('SendText', args: [subscriptionId, text]);
        messageController.clear();
      } catch (e) {
        _showErrorSnackbar('خطأ في الإرسال', 'فشل في إرسال الرسالة: ${e.toString()}');
        print('Send message error: $e');
      }
    } else if (_hubConnection?.state != HubConnectionState.connected) {
      _showErrorSnackbar('خطأ', 'غير متصل - يرجى المحاولة مرة أخرى');
    }
  }

  // التمرير لأسفل
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // إعادة الاتصال يدوياً
  Future<void> reconnect() async {
    _reconnectTimer?.cancel();
    _reconnectAttempts = 0;
    connectionError.value = '';
    await _hubConnection?.stop();
    await _connectToHub();
  }

  // فحص حالة الشبكة
  Future<bool> checkNetworkConnection() async {
    try {
      // يمكنك استخدام مكتبة connectivity_plus هنا
      return true; // مؤقتاً
    } catch (e) {
      return false;
    }
  }

  // تنسيق الوقت
  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    
    if (messageDate == today) {
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else {
      return '${dateTime.day}/${dateTime.month} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }

  // عرض رسالة خطأ
  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
    );
  }

  // تنظيف الموارد
  @override
  void onClose() {
    _reconnectTimer?.cancel();
    _hubConnection?.stop();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}