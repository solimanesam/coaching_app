import 'package:bloc/bloc.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_subscription_plans_state.dart';

class GetSubscriptionPlansCubit extends Cubit<GetSubscriptionPlansState> {
  GetSubscriptionPlansCubit(this.baseClientSubscriptionRepo) : super(GetSubscriptionPlansLoading());

  final BaseClientSubscriptionRepo baseClientSubscriptionRepo;

  void getSubscriptionPlans() async {
    final Either<Failure, List<PlanEntity>> result =
        await baseClientSubscriptionRepo.getSubscriptionPlans();
    result.fold((l) {
      emit(GetSubscriptionPlansFailed(errorMessage: l.message));
    }, (r) {
      emit(GetSubscriptionPlansSuccess(subscriptionPlans: r));
    });
  }
}
