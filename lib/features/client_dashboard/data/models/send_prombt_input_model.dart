import 'package:coaching_app/features/client_dashboard/domain/entities/chat_bot_response_entity.dart';

class ChatBotModel extends ChatBotResponseEntity {
  const ChatBotModel({required super.answer});
  factory ChatBotModel.fromJson(Map<String, dynamic> json) =>
      ChatBotModel(answer: json['answer']);
}
