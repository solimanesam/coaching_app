import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/chat_bot_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChatBotRepo {
  Future<Either<Failure, ChatBotResponseEntity>> sendPrombt(
      {required ChatBotParameters chatBotParameters});
}

class ChatBotParameters {
  final String question;
  ChatBotParameters({required this.question});
}
