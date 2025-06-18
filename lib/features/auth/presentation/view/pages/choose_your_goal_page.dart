// import 'package:coaching_app/core/constants/view_constants.dart';
// import 'package:coaching_app/core/widgets/custom_app_bar.dart';
// import 'package:coaching_app/core/widgets/custom_button.dart';
// import 'package:coaching_app/features/auth/presentation/view/components/check_boxs_bloc_builder.dart';
// import 'package:flutter/material.dart';

// class ChooseYourGoalPage extends StatelessWidget {
//   const ChooseYourGoalPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           customAppBar(
//               customAppBarInputModel: CustomAppBarInputModel(
//             appBarTitle: ViewConstants.chooseYourGoalPageAppBarTitle,
//             context: context,
//             iconButtonOnPressedFunction: () => Navigator.pop(context),
//           )),
//           CheckBoxsBlocBuilder(
//             count: 4,
//             checkBoxsNames: ViewConstants.chooseYourGoalPageCheckBoxSNames,
//           ),
//           customButton(
//               customButtonInputModel: CustomButtonInputModel(
//             context: context,
//             buttonName: ViewConstants.continueButtonText,
//             onPressedFunction: () => Navigator.pushNamed(
//               context,
//               'FillYourProfilePage',
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
