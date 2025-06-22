import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/coach_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/subscriber_model.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';

abstract class BaseCoachSubscriptionRemoteDataSource {
  Future<List<Subscriber>> getSubscribers();
  Future<void> createPlane({required CoachPlanInputModel coachPlanInputModel});
    Future<void> uploadPersonalizedPlan({required UploadPersonalizedPlanInputModel uploadPersonalizedPlanInputModel});

}

class CoachSubscriptionRemoteDataSource
    extends BaseCoachSubscriptionRemoteDataSource {
  CoachSubscriptionRemoteDataSource({required this.apiService});

  final ApiService apiService;

  @override
  Future<void> createPlane(
      {required CoachPlanInputModel coachPlanInputModel}) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.createPlanUrl,
            body: coachPlanInputModel.toJson(),
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
  }

  @override
  Future<List<Subscriber>> getSubscribers() async {
    final Map<String, dynamic> body = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.getSubscribersUrl,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    final List<Map<String, dynamic>> json = body["subscribers"];
    final List<Subscriber> subscribers =
        List.from(json.map((e) => SubscriberModel.fromJson(e)));
    return subscribers;
  }
  
  @override
  Future<void> uploadPersonalizedPlan({required UploadPersonalizedPlanInputModel uploadPersonalizedPlanInputModel}) async{
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstants.uploadPersonalizedPlanUrl,
            body: uploadPersonalizedPlanInputModel.toJson(),
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
  }
}
