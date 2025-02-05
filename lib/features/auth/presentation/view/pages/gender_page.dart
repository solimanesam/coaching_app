import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: 'Choose Your Gender',
            context: context,
            iconButtonOnPressedFunction: () {},
          )),
          ...List.generate(
              2,
              (index) => customCheckBox(
                  customCheckBoxInputModel: CustomCheckBoxInputModel(
                      context: context,
                      checkBoxName: genderCheckBoxSNames[index]))),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: 'Continue',
            onPressedFunction: () {},
          ))
        ],
      ),
    );
  }
}

List<String> genderCheckBoxSNames = ['Male', 'Female'];
