import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/helper_function/handle_server_exception.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/remote_data_source/chat_bot_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/chat_bot_response_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';
import 'package:dartz/dartz.dart';

class ChatBotRepo extends BaseChatBotRepo {
  final BaseChatBotRemoteDataSource chatBotRemoteDataSource;
  ChatBotRepo({required this.chatBotRemoteDataSource});
  @override
  Future<Either<Failure, ChatBotResponseEntity>> sendPrombt(
      {required ChatBotParameters chatBotParameters}) async {
    try {
      final result = await chatBotRemoteDataSource.sendPrombt(
          chatBotParameters: chatBotParameters);
      return right(result);
    } catch (e) {
      return left(handelServerException(e));
    }
  }
}
