import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class ChooseYourGoalPage extends StatelessWidget {
  const ChooseYourGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: 'Choose Your Goal',
            context: context,
            iconButtonOnPressedFunction: () => Navigator.pop(context),
          )),
          Column(
            spacing: 30.0,
              children: List.generate(
                  4,
                  (index) => customCheckBox(
                      customCheckBoxInputModel: CustomCheckBoxInputModel(
                          context: context,
                          checkBoxName: ViewConstants
                              .chooseYourGoalPageCheckBoxSNames[index])))),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: ViewConstants.continueButtonText,
            onPressedFunction: () => Navigator.pushNamed(
              context,
              'FillYourProfilePage',
            ),
          ))
        ],
      ),
    );
  }
}
