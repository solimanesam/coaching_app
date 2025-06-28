import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/coach_plan_input_model.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCoachSubscriptionRepo {
  Future<Either<Failure, List<Subscriber>>> getSubscribers();
  Future<Either<Failure, List<SubscriberFileEntity>>> getSubscriberFilesByUser(
      {required String userName});
  Future<Either<Failure, Unit>> createPlane(
      {required CoachPlanInputModel coachPlanInputModel});
  Future<Either<Failure, Unit>> uploadPersonalizedPlan(
      {required UploadPersonalizedPlanInputModel
          uploadPersonalizedPlanInputModel});
}
