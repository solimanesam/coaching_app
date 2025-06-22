import 'package:coaching_app/core/constants/api_constants.dart';
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
    final Map<String, dynamic> body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscriptionPlansUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    final List<Map<String, dynamic>> json = body["subscriptionPlans"];
    return List.from(json.map((e) => PlanModel.fromJson(e)).toList());
  }

  @override
  Future<List<PlanEntity>> getSubscriptionPlans() async {
    final Map<String, dynamic> body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscriptionPlansUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    final List<Map<String, dynamic>> json = body["subscriptionPlans"];
    return List.from(json.map((e) => PlanModel.fromJson(e)).toList());
  }

  @override
  Future<void> subscribe(
      {required SubscribeInputModel subscribeInputModel}) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.subscribeUrl,
            body: subscribeInputModel.toJson(),
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
  }
  
  @override
  Future<List<SubscriberFileEntity>> getSubscriberFiles() async{
    final Map<String, dynamic> body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscriberFilesUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    final List<Map<String, dynamic>> json = body["subscriberFiles"];
    return List.from(json.map((e) => SubscriberFileModel.fromJson(e)).toList());
  }
}
