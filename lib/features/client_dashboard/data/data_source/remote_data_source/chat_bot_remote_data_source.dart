import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/send_prombt_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';

abstract class BaseChatBotRemoteDataSource {
  Future<ChatBotModel> sendPrombt(
      {required ChatBotParameters chatBotParameters});
}

class ChatBotRemoteDataSource extends BaseChatBotRemoteDataSource {
  ChatBotRemoteDataSource({required this.apiService});

  final ApiService apiService;

  @override
  Future<ChatBotModel> sendPrombt(
      {required ChatBotParameters chatBotParameters}) async {
    final response = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.sendPrombtUrl,
            body: {'question': chatBotParameters.question}));

    return ChatBotModel.fromJson(response);
  }
}
