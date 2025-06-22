part of 'get_coach_plan_by_coach_cubit.dart';

sealed class GetCoachPlanByCoachState extends Equatable {
  const GetCoachPlanByCoachState();

  @override
  List<Object?> get props => [];
}

final class GetSubscriptionPlanByCoachLoading extends GetCoachPlanByCoachState {}

final class GetSubscriptionPlanByCoachSuccess extends GetCoachPlanByCoachState {
  const GetSubscriptionPlanByCoachSuccess({required this.subscriptionPlan});

  final List<PlanEntity> subscriptionPlan;

  @override
  List<Object?> get props => [subscriptionPlan];
}

final class GetSubscriptionPlanByCoachFailed extends GetCoachPlanByCoachState {
  const GetSubscriptionPlanByCoachFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
