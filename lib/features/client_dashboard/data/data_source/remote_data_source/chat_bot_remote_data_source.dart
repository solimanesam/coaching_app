import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/send_prombt_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/chat_bot_response_entity.dart';

abstract class BaseChatBotRemoteDataSource {
  Future<ChatBotResponseEntity> sendPrombt({required SendPrombtInputModel sendPrombtInputModel});
}

class ChatBotRemoteDataSource extends BaseChatBotRemoteDataSource {
  ChatBotRemoteDataSource({required this.apiService});

  final ApiService apiService;

  @override
  Future<ChatBotResponseEntity> sendPrombt(
      {required SendPrombtInputModel sendPrombtInputModel}) async {
      //   final ChatBotResponseEntity response ChatBotResponseEntity response;
      // await apiService.post(
      //   apiServiceInputModel: ApiServiceInputModel(
      //       url: ApiConstants.sendPrombtUrl,
      //       body: sendPrombtInputModel.toJson(),
      //       apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
      //   return response;  
    return ChatBotResponseEntity();  
  }
}
