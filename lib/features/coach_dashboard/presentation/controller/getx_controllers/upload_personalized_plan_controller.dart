import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/services/file_picker_service.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/upload_personalized_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/get_subscribers_by_user.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UploadPersonalizedPlanController extends GetxController {
  UploadPersonalizedPlanController(
      this.baseCoachSubscriptionRepo, this.filePicker);

  final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;
  final BaseFilePicker filePicker;

  RequestStateEnum? uploadPersonalizedPlanPlanState;

  void uploadPersonalizedPlan({required String subscriberUserName}) async {
    final filePath = await filePicker.pickFile();

    if (filePath != null) {
      uploadPersonalizedPlanPlanState = RequestStateEnum.loading;
      update();

      final Either<Failure, Unit> result =
          await baseCoachSubscriptionRepo.uploadPersonalizedPlan(
              uploadPersonalizedPlanInputModel:
                  UploadPersonalizedPlanInputModel(
                      filePath: filePath,
                      subscriberUserName: subscriberUserName));
      result.fold((l) {
        uploadPersonalizedPlanPlanState = RequestStateEnum.failed;
        AppSnackBar.show(message: l.message, type: SnackBarType.error);
      }, (r) {
        uploadPersonalizedPlanPlanState = RequestStateEnum.success;
        AppSnackBar.show(
            message: "file uploaded successfully", type: SnackBarType.success);
            Get.find<GetSubscriberFilesByUserController>().getSubscriberByUserFiles(userName:subscriberUserName );
      });
      update();
    } else {
      AppSnackBar.show(message: 'No file selected', type: SnackBarType.warning);
    }
  }
}
