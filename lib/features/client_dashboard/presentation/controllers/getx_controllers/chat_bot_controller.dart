import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';
import 'package:get/get.dart';

class ChatBotController extends GetxController{
  ChatBotController(this.baseChatBotRepo);

  final BaseChatBotRepo baseChatBotRepo;
  
  
}