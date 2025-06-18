import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BaseClientSubscriptionRepo {
  Future<Either<Failure, List>> getSubscriptionPlans();
  Future<Either<Failure, List>> getSubscriptionPlanByCoach({required });
  Future<Either<Failure, Unit>> subscribe({required });
}