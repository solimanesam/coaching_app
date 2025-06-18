part of 'get_subscription_plans_cubit.dart';

sealed class GetSubscriptionPlansState extends Equatable{
  const GetSubscriptionPlansState();
  @override
  List<Object?> get props => [];
}

final class GetSubscriptionPlansLoading extends GetSubscriptionPlansState {}

final class GetSubscriptionPlansSuccess extends GetSubscriptionPlansState {
  const GetSubscriptionPlansSuccess({required this.subscriptionPlans});

  final List subscriptionPlans;

  @override
  List<Object?> get props => [subscriptionPlans];
}

final class GetSubscriptionPlansFailed extends GetSubscriptionPlansState {
  const GetSubscriptionPlansFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
