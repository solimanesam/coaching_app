import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetSubscriberFilesByUserController extends GetxController {
  GetSubscriberFilesByUserController(this.baseCoachSubscriptionRepo);

  final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;

  RequestStateEnum? getSubscriberFilesByUserState;
  List<SubscriberFileEntity> subscriberFiles = const [];
  String? getSubscriberFilesErrorMessage;
  bool isPressed = false;

  void getSubscriberByUserFiles({required String userName}) async {
    isPressed = true;
    getSubscriberFilesByUserState = RequestStateEnum.loading;
    update();

    final Either<Failure, List<SubscriberFileEntity>> result =
        await baseCoachSubscriptionRepo.getSubscriberFilesByUser(
            userName: userName);

    result.fold((l) {
      getSubscriberFilesByUserState = RequestStateEnum.failed;
      getSubscriberFilesErrorMessage = l.message;
    }, (r) {
      getSubscriberFilesByUserState = RequestStateEnum.success;
      subscriberFiles = r;
    });

    update();
  }
}

