import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseClientSubscriptionRepo {
  Future<Either<Failure, List<PlanEntity>>> getSubscriptionPlans();
  Future<Either<Failure, List<PlanEntity>>> getSubscriptionPlanByCoach(
      {required SubscriptionPlanByCoachInputModel
          subscriptionPlanByCoachInputModel});
  Future<Either<Failure, Unit>> subscribe(
      {required SubscribeInputModel subscribeInputModel});
  Future<Either<Failure, List<SubscriberFileEntity>>> getSubscriberFiles();
}
