import 'package:coaching_app/coach_plan_input_model.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCoachSubscriptionRepo {
  Future<Either<Failure, List>> getSubscribers();
  Future<Either<Failure, Unit>> createPlane({required CoachPlanInputModel coachPlanInputModel});
}