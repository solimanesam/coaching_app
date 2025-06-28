import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscriber_file_model.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/coach_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/subscriber_model.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';

abstract class BaseCoachSubscriptionRemoteDataSource {
  Future<List<Subscriber>> getSubscribers();
  Future<List<SubscriberFileModel>> getSubscriberFilesByUser(
      {required String userName});
  Future<void> createPlane({required CoachPlanInputModel coachPlanInputModel});
  Future<void> uploadPersonalizedPlan(
      {required UploadPersonalizedPlanInputModel
          uploadPersonalizedPlanInputModel});
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
    final dynamic body = await apiService.get(
      apiServiceInputModel: ApiServiceInputModel(
        url: ApiConstants.getSubscribersUrl,
        apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
      ),
    );

    if (body is List) {
      return body
          .where((item) =>
              item['userName'] != null &&
              item['email'] != null &&
              item['height'] != null &&
              item['weight'] != null)
          .map((item) => SubscriberModel.fromJson(item))
          .toList();
    } else if (body is Map<String, dynamic>) {
      throw Exception(body['message'] ?? 'Unexpected error');
    } else {
      throw Exception('Invalid response format');
    }
  }

  @override
  Future<void> uploadPersonalizedPlan(
      {required UploadPersonalizedPlanInputModel
          uploadPersonalizedPlanInputModel}) async {
    await apiService.postFormData(
      url:
          '${ApiConstants.uploadPersonalizedPlanUrl}?subscriberUserName=${uploadPersonalizedPlanInputModel.subscriberUserName}',
      formData: await uploadPersonalizedPlanInputModel.toJson(),
      headersType: ApiHeadersEnum.backEndHeadersWithToken,
    );
  }

  @override
  Future<List<SubscriberFileModel>> getSubscriberFilesByUser(
      {required String userName}) async {
    try {
      final body = await apiService.get(
          apiServiceInputModel: ApiServiceInputModel(
              url:
                  '${ApiConstants.getSubscribationFilesByUserUrl}?subscriberUserName=$userName',
              apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
      return List.from((body['data'] as List)
          .map((e) => SubscriberFileModel.fromJsonByuser(e))
          .toList());
    } catch (e) {
      print(e);
      throw ServerException(message: e.toString());
    }
  }
}
