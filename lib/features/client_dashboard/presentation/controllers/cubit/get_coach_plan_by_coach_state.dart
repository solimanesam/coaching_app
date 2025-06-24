part of 'get_coach_plan_by_coach_cubit.dart';

sealed class GetCoachPlanByCoachState extends Equatable {
  const GetCoachPlanByCoachState();

  @override
  List<Object?> get props => [];
}

final class GetSubscriptionPlanByCoachLoading extends GetCoachPlanByCoachState {}

final class GetSubscriptionPlanByCoachSuccess extends GetCoachPlanByCoachState {
  const GetSubscriptionPlanByCoachSuccess({required this.subscriptionPlans});

  final List<PlanEntity> subscriptionPlans;

  @override
  List<Object?> get props => [subscriptionPlans];
}

final class GetSubscriptionPlanByCoachFailed extends GetCoachPlanByCoachState {
  const GetSubscriptionPlanByCoachFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
