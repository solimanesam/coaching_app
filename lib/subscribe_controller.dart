// import 'package:coaching_app/base_client_subscription_repo.dart';
// import 'package:coaching_app/coach_plan_input_model.dart';
// import 'package:coaching_app/base_coach_subscription_repo.dart';
// import 'package:coaching_app/core/errors/failures.dart';
// import 'package:coaching_app/core/utils/enums.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/widgets.dart';

// class SubscribeController extends GetxController {
//   SubscribeController(this.baseClientSubscriptionRepo);

//   final BaseClientSubscriptionRepo baseClientSubscriptionRepo;
//   RequestStateEnum? createCoachPlanState;

//   void subscribe() async {
//     createCoachPlanState = RequestStateEnum.loading;
//     update();
//     final Either<Failure, Unit> result =
//         await baseClientSubscriptionRepo.subscribe();
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
