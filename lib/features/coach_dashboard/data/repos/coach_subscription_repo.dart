import 'package:coaching_app/core/helper_function/handle_server_exception.dart';
import 'package:coaching_app/features/coach_dashboard/data/data_sources/remote_data_source/coach_subscription_remote_data_source.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/coach_plan_input_model.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class CoachSubscriptionRepo extends BaseCoachSubscriptionRepo {
  CoachSubscriptionRepo({required this.baseCoachSubscriptionRemoteDataSource});

  final BaseCoachSubscriptionRemoteDataSource
      baseCoachSubscriptionRemoteDataSource;

  @override
  Future<Either<Failure, Unit>> createPlane(
      {required CoachPlanInputModel coachPlanInputModel}) async {
    try {
      await baseCoachSubscriptionRemoteDataSource.createPlane(
          coachPlanInputModel: coachPlanInputModel);
      return const Right(unit);
    } catch (e) {
      return left(handelServerException(e));
    }
  }

  @override
  Future<Either<Failure, List<Subscriber>>> getSubscribers() async {
    final List<Subscriber> subscribers;
    try {
      subscribers =
          await baseCoachSubscriptionRemoteDataSource.getSubscribers();
      return right(subscribers);
    } catch (e) {
      print(e.toString());
      return left(handelServerException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadPersonalizedPlan({required UploadPersonalizedPlanInputModel uploadPersonalizedPlanInputModel}) async{
    try {
      await baseCoachSubscriptionRemoteDataSource.uploadPersonalizedPlan(
          uploadPersonalizedPlanInputModel: uploadPersonalizedPlanInputModel);
      return const Right(unit);
    } catch (e) {
      return left(handelServerException(e));
    }
  }
}
