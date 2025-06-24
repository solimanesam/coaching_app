import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/services/image_picker_service.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UploadPersonalizedPlanController extends GetxController {
  UploadPersonalizedPlanController(this.baseCoachSubscriptionRepo);

  final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;

  RequestStateEnum? createCoachPlanState;

  void uploadPersonalizedPlan() async {
    createCoachPlanState = RequestStateEnum.loading;
    update();
    // final Either<Failure, Unit> result =
    //     await baseCoachSubscriptionRepo.uploadPersonalizedPlan(
    //         uploadPersonalizedPlanInputModel: UploadPersonalizedPlanInputModel(
    //             planFile: planFile, subscriberUserName: subscriberUserName));
    // result.fold((l) {
    //   createCoachPlanState = RequestStateEnum.failed;
    //   AppSnackBar.show(message: l.message, type: SnackBarType.error);
    // }, (r) {
    //   createCoachPlanState = RequestStateEnum.success;
    //   AppSnackBar.show(
    //       message: "file uploaded successfully",
    //       type: SnackBarType.success);
    // });
    update();
  }
}
