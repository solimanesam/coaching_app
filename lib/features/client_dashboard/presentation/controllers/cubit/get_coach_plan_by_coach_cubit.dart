import 'package:bloc/bloc.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_coach_plan_by_coach_state.dart';

class GetCoachPlanByCoachCubit extends Cubit<GetCoachPlanByCoachState> {
  GetCoachPlanByCoachCubit(this.baseClientSubscriptionRepo)
      : super(GetSubscriptionPlanByCoachLoading());

  final BaseClientSubscriptionRepo baseClientSubscriptionRepo;

  void getCoachPlanByCoach(
      {required SubscriptionPlanByCoachInputModel
          subscriptionPlanByCoachInputModel}) async {
    final Either<Failure, List<PlanEntity>> result =
        await baseClientSubscriptionRepo.getSubscriptionPlanByCoach(
            subscriptionPlanByCoachInputModel:
                subscriptionPlanByCoachInputModel);
    result.fold((l) {
      emit(GetSubscriptionPlanByCoachFailed(errorMessage: l.message));
    }, (r) {
      emit(GetSubscriptionPlanByCoachSuccess(subscriptionPlan: r));
    });
  }
}
