import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/plan_model.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscriber_file_model.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';

abstract class BaseClientSubscriptionRemoteDataSource {
  Future<List<PlanEntity>> getSubscriptionPlans();
  Future<List<PlanEntity>> getSubscriptionPlanByCoach({required SubscriptionPlanByCoachInputModel subscriptionPlanByCoachInputModel});
  Future<void> subscribe({required SubscribeInputModel subscribeInputModel});
    Future<List<SubscriberFileEntity>> getSubscriberFiles();

}

class ClientSubscriptionRemoteDataSource
    extends BaseClientSubscriptionRemoteDataSource {
  ClientSubscriptionRemoteDataSource({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<PlanEntity>> getSubscriptionPlanByCoach({required SubscriptionPlanByCoachInputModel subscriptionPlanByCoachInputModel}) async{
   try {final  body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: "${ApiConstants.getSubscriptionPlanByCoachUrl}?userName=${subscriptionPlanByCoachInputModel.coashName}",
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    return List.from((body as List).map((e) => PlanModel.fromJson(e)).toList());}
    catch(e){
      print(e);
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<PlanEntity>> getSubscriptionPlans() async {
    final  body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscriptionPlansUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    return List.from((body as List).map((e) => PlanModel.fromJson(e)).toList());
  }

  @override
  Future<void> subscribe(
      {required SubscribeInputModel subscribeInputModel}) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: "${ApiConstants.subscribeUrl}?subscriptionPlanId=${subscribeInputModel.planId}",
            
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
  }
  
  @override
  Future<List<SubscriberFileEntity>> getSubscriberFiles() async{
    final body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscriberFilesUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    return List.from((body['data'] as List).map((e) => SubscriberFileModel.fromJson(e)).toList());
  }
}
