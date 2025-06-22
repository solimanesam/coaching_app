import 'package:bloc/bloc.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_subscribers_state.dart';

class GetSubscribersCubit extends Cubit<GetSubscribersState> {
  GetSubscribersCubit(this.baseCoachSubscriptionRepo)
      : super(const GetSubscribersState());

  final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;

  void getSubscribers() async {
    final Either<Failure, List<Subscriber>> result =
        await baseCoachSubscriptionRepo.getSubscribers();
    result.fold((l) {
      emit(GetSubscribersState(
          getSubscribersState: RequestStateEnum.failed,
          getSubscribersErrorMessage: l.message));
    }, (r) {
      emit(GetSubscribersState(
          getSubscribersState: RequestStateEnum.success, subscribers: r));
    });
  }
}
