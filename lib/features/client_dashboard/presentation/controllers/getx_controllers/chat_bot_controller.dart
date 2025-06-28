import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String message;
  final bool isUser;

  ChatMessage({required this.message, required this.isUser});
}

class ChatBotController extends GetxController {
  ChatBotController(this.baseChatBotRepo);

  final BaseChatBotRepo baseChatBotRepo;
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<ChatMessage> messages = [];
  RequestStateEnum? sendMessageState;
  String? messageError;

  sendPrompet() async {
    if (formKey.currentState!.validate()) {
      final userMessage = messageController.text.trim();
      messageController.clear();

      messages.add(ChatMessage(message: userMessage, isUser: true));
      sendMessageState = RequestStateEnum.loading;
      update();

      final result = await baseChatBotRepo.sendPrombt(
          chatBotParameters: ChatBotParameters(question: userMessage));

      result.fold((l) {
        sendMessageState = RequestStateEnum.failed;
        messageError = l.message;
        messages.add(ChatMessage(message: 'حدث خطأ: ${l.message}', isUser: false));
      }, (r) {
        sendMessageState = RequestStateEnum.success;
        messages.add(ChatMessage(message: r.answer, isUser: false));
      });
      update();
    }
  }
}
