import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/core/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

class FillYourProfilePage extends StatelessWidget {
  const FillYourProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: ViewConstants.fillYourProfilePageAppBarTitle,
            context: context,
            iconButtonOnPressedFunction: () => Navigator.pop(context),
          )),
          ProfileImageWidget(),
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
                    .fillYourProfilePageTextFieldsHintTexts[index],
              )),
            )),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: ViewConstants.doneButtonText,
            onPressedFunction: () {},
          ))
        ],
      ),
    );
  }
}
