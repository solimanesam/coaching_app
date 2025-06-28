import 'package:get/get.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repos/chat_repo.dart';

class ChatController extends GetxController {
  final ChatRepo chatRepo;

  ChatController({required this.chatRepo});

  RxList<MessageEntity> messages = <MessageEntity>[].obs;

  late String currentUsername;
  late String receiverUsername;

  Future<void> initConnection({required String currentUser,required String receiverUser}) async {
    currentUsername = currentUser;
    receiverUsername = receiverUser;
    await chatRepo.connect(currentUsername: currentUsername);

    final cached = await chatRepo.loadCachedMessages();
    messages.addAll(
      cached.where((m) =>
        (m.senderUsername == currentUsername && m.receiverUsername == receiverUsername) ||
        (m.senderUsername == receiverUsername && m.receiverUsername == currentUsername)
      ),
    );

    chatRepo.receiveMessages().listen((msg) {
      if ((msg.senderUsername == receiverUsername && msg.receiverUsername == currentUsername) ||
          (msg.senderUsername == currentUsername && msg.receiverUsername == receiverUsername)) {
        messages.add(msg);
      }
    });
  }

  void sendMessage(String text) async {
    final message = MessageEntity(
      senderUsername: currentUsername,
      receiverUsername: receiverUsername,
      message: text,
      timestamp: DateTime.now(),
    );
    messages.add(message);
    await chatRepo.sendMessage(message);
  }

  @override
  void onClose() {
    chatRepo.disconnect();
    super.onClose();
  }
}

