import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubscribeController extends GetxController {
  SubscribeController(this.baseClientSubscriptionRepo);

  final BaseClientSubscriptionRepo baseClientSubscriptionRepo;

  RequestStateEnum? createCoachPlanState;

  void subscribe(SubscribeInputModel subscribeInputModel) async {
    createCoachPlanState = RequestStateEnum.loading;
    update();
    final Either<Failure, Unit> result = await baseClientSubscriptionRepo
        .subscribe(subscribeInputModel: subscribeInputModel);
    result.fold((l) {
      createCoachPlanState = RequestStateEnum.failed;
      AppSnackBar.show(message: l.message, type: SnackBarType.error);
    }, (r) {
      createCoachPlanState = RequestStateEnum.success;
      AppSnackBar.show(
          message: "you have successfully subscribed",
          type: SnackBarType.success);
    });
    update();
  }
}
