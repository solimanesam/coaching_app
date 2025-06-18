import 'package:bloc/bloc.dart';
import 'package:coaching_app/base_client_subscription_repo.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_subscription_plans_state.dart';

class GetSubscriptionPlansCubit extends Cubit<GetSubscriptionPlansState> {
  GetSubscriptionPlansCubit(this.baseClientSubscriptionRepo) : super(GetSubscriptionPlansLoading());

  final BaseClientSubscriptionRepo baseClientSubscriptionRepo;

  void getSubscriptionPlans() async {
    final Either<Failure, List<dynamic>> result =
        await baseClientSubscriptionRepo.getSubscriptionPlans();
    result.fold((l) {
      emit(GetSubscriptionPlansFailed(errorMessage: l.message));
    }, (r) {
      emit(GetSubscriptionPlansSuccess(subscriptionPlans: r));
    });
  }
}
