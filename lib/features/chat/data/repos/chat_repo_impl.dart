import 'dart:async';
import 'package:hive/hive.dart';
import 'package:signalr_core/signalr_core.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repos/chat_repo.dart';
import '../models/message_model.dart';

class ChatRepoImpl implements ChatRepo {
  late HubConnection _connection;
  final _messageStreamController = StreamController<MessageEntity>.broadcast();
  final _box = Hive.box<MessageModel>('chatBox');
  late String _currentUser;

  @override
  Future<void> connect({required String currentUsername}) async {
    _currentUser = currentUsername;
    _connection = HubConnectionBuilder()
        .withUrl('https://yourserver.com/chatHub?userId=$currentUsername')
        .build();

    _connection.on('ReceiveMessage', (arguments) {
      final message = MessageEntity(
        senderUsername: arguments![0],
        receiverUsername: currentUsername,
        message: arguments[1],
        timestamp: DateTime.now(),
      );
      cacheMessage(message);
      _messageStreamController.add(message);
    });

    await _connection.start();
  }

  @override
  Future<void> disconnect() async {
    await _connection.stop();
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    await _connection.invoke('SendMessageToUser', args: [
      message.receiverUsername,
      message.message,
    ]);
    cacheMessage(message);
  }

  @override
  Stream<MessageEntity> receiveMessages() => _messageStreamController.stream;

  @override
  Future<void> cacheMessage(MessageEntity message) async {
    final model = MessageModel(
      senderUsername: message.senderUsername,
      receiverUsername: message.receiverUsername,
      message: message.message,
      timestamp: message.timestamp,
    );
    await _box.add(model);
  }

  @override
  Future<List<MessageEntity>> loadCachedMessages() async {
    return _box.values.map((model) => MessageEntity(
      senderUsername: model.senderUsername,
      receiverUsername: model.receiverUsername,
      message: model.message,
      timestamp: model.timestamp,
    )).toList();
  }
}
