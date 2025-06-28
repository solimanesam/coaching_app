import 'package:coaching_app/features/chat/presentation/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  final String currentUsername;
  final String receiverUsername;
  final ChatController chatController;

  ChatPage(
      {required this.currentUsername,
      required this.receiverUsername,
      required this.chatController});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    chatController.initConnection(currentUser:  currentUsername,receiverUser:  receiverUsername);

    return Scaffold(
      appBar: AppBar(title: Text('Chat with $receiverUsername')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chatController.messages[index];
                    final isMine = msg.senderUsername == currentUsername;
                    return Align(
                      alignment:
                          isMine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isMine ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(msg.message),
                      ),
                    );
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(hintText: 'Enter message...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      chatController.sendMessage(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
