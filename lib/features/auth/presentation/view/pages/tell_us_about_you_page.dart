import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class TellUsAboutYouPage extends StatelessWidget {
  const TellUsAboutYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: 'Tell Us About You',
            context: context,
            iconButtonOnPressedFunction: () {},
          )),
          ...List.generate(
              3,
              (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * .10),
                    child: customTextField(
                        textFieldInputModel: TextFieldInputModel(
                      context: context,
                      controller: TextEditingController(),
                      textHint: ViewConstants
                          .tellUsAboutYouPageTextFieldsHintTexts[index],
                    )),
                  )),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: ViewConstants.continueButtonText,
            onPressedFunction: () => Navigator.pushNamed(context, 'ChooseYourGenderPage'),
          ))
        ],
      ),
    );
  }
}
