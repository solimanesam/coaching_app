import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/auth/presentation/view/components/check_boxs_bloc_builder.dart';

import 'package:flutter/material.dart';

class ChooseYourGenderPage extends StatelessWidget {
  const ChooseYourGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: ViewConstants.chooseYourGenderPageAppBarTitle,
            context: context,
            iconButtonOnPressedFunction: () => Navigator.pop(context),
          )),
          CheckBoxsBlocBuilder(
            count: 2,
            checkBoxsNames: ViewConstants.chooseYourGenderPageCheckBoxSNames,
          ),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: ViewConstants.continueButtonText,
            onPressedFunction: () => Navigator.pushNamed(
              context,
              'ChooseYourGoalPage',
            ),
          ))
        ],
      ),
    );
  }
}
