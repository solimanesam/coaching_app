import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/chat_bot_response_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotController extends GetxController {
  ChatBotController(this.baseChatBotRepo);

  final BaseChatBotRepo baseChatBotRepo;
  TextEditingController messageController = TextEditingController();
  String? messageError;
  RequestStateEnum? sendMessageState;
  ChatBotResponseEntity? chatBotResponseEntity;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendPrompet() async {
    if (formKey.currentState!.validate()) {
      sendMessageState = RequestStateEnum.loading;
      update();
      final result = await baseChatBotRepo.sendPrombt(
          chatBotParameters:
              ChatBotParameters(question: messageController.text));
      result.fold((l) {
        sendMessageState = RequestStateEnum.failed;
        messageError = l.message;
      }, (r) {
        sendMessageState = RequestStateEnum.success;
        chatBotResponseEntity = r;
      });
      update();
    }
  }
}
