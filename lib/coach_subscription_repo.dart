import 'package:coaching_app/base_coach_subscription_repo.dart';
import 'package:coaching_app/coach_plan_input_model.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class CoachSubscriptionRepo extends BaseCoachSubscriptionRepo{
  @override
  Future<Either<Failure, Unit>> createPlane({required CoachPlanInputModel coachPlanInputModel}) {
    // TODO: implement createPlane
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List>> getSubscribers() {
    // TODO: implement getSubscribers
    throw UnimplementedError();
  }
}