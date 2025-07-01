// import 'package:flutter/material.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class ChatPage extends StatefulWidget {
//   final String currentUser;
//   final String otherUser;

//   ChatPage({required this.currentUser, required this.otherUser});

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//   String channelName = '';
//   String eventName = 'message-event';
//   List<Map<String, String>> messages = [];
//   TextEditingController _controller = TextEditingController();
//   String? socketId;

//   @override
//   void initState() {
//     super.initState();
//     List<String> users = [widget.currentUser, widget.otherUser]..sort();
//     channelName = 'chat-${users[0]}-${users[1]}';
//     initPusher();
//   }

//   Future<void> initPusher() async {
//     try {
//       await pusher.init(
//         apiKey: 'YOUR_APP_KEY',  // استبدل بمفتاح التطبيق الخاص بك من Pusher
//         cluster: 'YOUR_CLUSTER',  // استبدل بـ Cluster الخاص بك من Pusher
//         onConnectionStateChange: (currentState, previousState) {
//           print('Connection: $currentState');
//         },
//         onError: (message, code, e) {
//           print('Error: $message');
//         },
//       );
//       await pusher.connect();
//       socketId = pusher.socketId;
//       await pusher.subscribe(channelName: channelName);
//       pusher.onEvent!((event) {
//         if (event.eventName == eventName) {
//           Map<String, dynamic> data = event.data;
//           String receivedMessage = data['message'];
//           String sender = data['sender'];
//           setState(() {
//             messages.add({'sender': sender, 'message': receivedMessage});
//           });
//         }
//       } as PusherEvent);
//     } catch (e) {
//       print('Error initializing Pusher: $e');
//     }
//   }

//   Future<void> sendMessage(String message) async {
//     try {
//       await pusher.trigger(
//         channelName: channelName,
//         eventName: eventName,
//         data: {'message': message, 'sender': widget.currentUser},
//         excludedSocketId: socketId,
//       );
//       setState(() {
//         messages.add({'sender': widget.currentUser, 'message': message});
//       });
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }

//   @override
//   void dispose() {
//     pusher.unsubscribe(channelName: channelName);
//     pusher.disconnect();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('دردشة مع ${widget.otherUser}')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 var messageData = messages[index];
//                 bool isMe = messageData['sender'] == widget.currentUser;
//                 return Align(
//                   alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     margin: EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: isMe ? Colors.blue : Colors.grey,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(messageData['message']!),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(hintText: 'أدخل رسالتك'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     String message = _controller.text;
//                     if (message.isNotEmpty) {
//                       sendMessage(message);
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }