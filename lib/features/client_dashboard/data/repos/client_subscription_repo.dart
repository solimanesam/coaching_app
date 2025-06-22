import 'package:coaching_app/core/helper_function/handle_server_exception.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/remote_data_source/client_subscription_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:dartz/dartz.dart';

class ClientSubscriptionRepo extends BaseClientSubscriptionRepo {
  ClientSubscriptionRepo(
      {required this.baseClientSubscriptionRemoteDataSource});

  final BaseClientSubscriptionRemoteDataSource
      baseClientSubscriptionRemoteDataSource;

  @override
  Future<Either<Failure, List<PlanEntity>>> getSubscriptionPlanByCoach(
      {required SubscriptionPlanByCoachInputModel
          subscriptionPlanByCoachInputModel}) async {
    final List<PlanEntity> subscriptionPlan;
    try {
      subscriptionPlan = await baseClientSubscriptionRemoteDataSource
          .getSubscriptionPlanByCoach(
              subscriptionPlanByCoachInputModel:
                  subscriptionPlanByCoachInputModel);
      return right(subscriptionPlan);
    } catch (e) {
      return left(handelServerException(e));
    }
  }

  @override
  Future<Either<Failure, List<PlanEntity>>> getSubscriptionPlans() async {
    final List<PlanEntity> subscriptionPlans;
    try {
      subscriptionPlans =
          await baseClientSubscriptionRemoteDataSource.getSubscriptionPlans();
      return right(subscriptionPlans);
    } catch (e) {
      return left(handelServerException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> subscribe(
      {required SubscribeInputModel subscribeInputModel}) async {
    try {
      await baseClientSubscriptionRemoteDataSource.subscribe(
          subscribeInputModel: subscribeInputModel);
      return const Right(unit);
    } catch (e) {
      return left(handelServerException(e));
    }
  }

  @override
  Future<Either<Failure, List<SubscriberFileEntity>>> getSubscriberFiles() async{
    final List<SubscriberFileEntity> subscriberFiles;
    try {
      subscriberFiles =
          await baseClientSubscriptionRemoteDataSource.getSubscriberFiles();
      return right(subscriberFiles);
    } catch (e) {
      return left(handelServerException(e));
    }
  }
}
