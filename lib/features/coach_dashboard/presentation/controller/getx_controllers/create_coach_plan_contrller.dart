import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/coach_plan_input_model.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateCoachPlanContrller extends GetxController {
  CreateCoachPlanContrller(this.baseCoachSubscriptionRepo);

  final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;
  RequestStateEnum? createCoachPlanState;
  
//text editing controllers
  final TextEditingController priceTextFieldController =
      TextEditingController();
  final TextEditingController durationInDaysTextFieldController =
      TextEditingController();
  final TextEditingController detailsTextFieldController =
      TextEditingController();

  void createPlan() async {
    createCoachPlanState = RequestStateEnum.loading;
    update();
    final Either<Failure, Unit> result =
        await baseCoachSubscriptionRepo.createPlane(
            coachPlanInputModel: CoachPlanInputModel(
                price: priceTextFieldController.text,
                durationInDays: durationInDaysTextFieldController.text,
                details: detailsTextFieldController.text));
    result.fold((l) {
      createCoachPlanState = RequestStateEnum.failed;
      AppSnackBar.show(message: l.message, type: SnackBarType.error);
    }, (r) {
      createCoachPlanState = RequestStateEnum.success;
      AppSnackBar.show(message: "your coaching plan has been successfully created and is now ready to use!", type: SnackBarType.success);
      _clearTextFields();
    });
    update();

  }

  void _clearTextFields() {
    priceTextFieldController.clear();
    durationInDaysTextFieldController.clear();
    detailsTextFieldController.clear();
  }
}
