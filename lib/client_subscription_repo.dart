import 'package:coaching_app/base_client_subscription_repo.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class ClientSubscriptionRepo extends BaseClientSubscriptionRepo{
  @override
  Future<Either<Failure, List>> getSubscriptionPlanByCoach({required}) {
    // TODO: implement getSubscriptionPlanByCoach
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List>> getSubscriptionPlans() {
    // TODO: implement getSubscriptionPlans
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> subscribe({required}) {
    // TODO: implement subscribe
    throw UnimplementedError();
  }
}