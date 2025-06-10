import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/helper_function/number_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/choose_your_gender_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TellUsAboutYouPage extends StatelessWidget {
  const TellUsAboutYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController =Get.find<AuthController>();
    return Scaffold(
      body: Form(
        key: authController.tellUsPageFormkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customAppBar(
                customAppBarInputModel: CustomAppBarInputModel(
              appBarTitle: 'Tell Us About You',
              context: context,
              iconButtonOnPressedFunction: () {
                Get.back();
              },
            )),
            ...List.generate(
                3,
                (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.widthResponsive * .10),
                      child: customTextField(
                          textFieldInputModel: TextFieldInputModel(
                        context: context,
                        validator: (value) => validateNumber(value),
                        controller: authController.tellUsPageControllers[index],
                        textHint: ViewConstants
                            .tellUsAboutYouPageTextFieldsHintTexts[index],
                      )),
                    )),
            customButton(
                customButtonInputModel: CustomButtonInputModel(
              context: context,
              buttonName: ViewConstants.continueButtonText,
              onPressedFunction: (){  if (authController.tellUsPageFormkey.currentState!.validate()) {
                  Get.to(()=> ChooseYourGenderPage());
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
