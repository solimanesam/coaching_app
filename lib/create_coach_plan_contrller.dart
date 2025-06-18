// import 'package:coaching_app/coach_plan_input_model.dart';
// import 'package:coaching_app/base_coach_subscription_repo.dart';
// import 'package:coaching_app/core/errors/failures.dart';
// import 'package:coaching_app/core/utils/enums.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/widgets.dart';

// class CreateCoachPlanContrller extends GetxController {
//   CreateCoachPlanContrller(this.baseCoachSubscriptionRepo);

//   final BaseCoachSubscriptionRepo baseCoachSubscriptionRepo;
//   RequestStateEnum? createCoachPlanState;

// //text editing controllers
//   final TextEditingController priceTextFieldController =
//       TextEditingController();
//   final TextEditingController durationInDaysTextFieldController =
//       TextEditingController();
//   final TextEditingController detailsTextFieldController =
//       TextEditingController();

//   void createPlan() async {
//     createCoachPlanState = RequestStateEnum.loading;
//     update();
//     final Either<Failure, Unit> result =
//         await baseCoachSubscriptionRepo.createPlane(
//             coachPlanInputModel: CoachPlanInputModel(
//                 price: priceTextFieldController.text,
//                 durationInDays: durationInDaysTextFieldController.text,
//                 details: detailsTextFieldController.text));
//     result.fold((l) {
//       createCoachPlanState = RequestStateEnum.failed;
//       //todo
//       // show sneackbar
//     }, (r) {
//       createCoachPlanState = RequestStateEnum.success;
//       //todo
//       // show sneackbar
//     });
//     update();

//   }
// }
