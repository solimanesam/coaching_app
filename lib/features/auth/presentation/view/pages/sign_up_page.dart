
import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/helper_function/email_validate.dart';
import 'package:coaching_app/core/helper_function/name_validate.dart';
import 'package:coaching_app/core/helper_function/password_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/view/components/custom_navigation_bar.dart';
import 'package:coaching_app/features/auth/presentation/view/components/radio_button.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/tell_us_about_you_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      bottomNavigationBar: customNavigationbar(
        context,
        onTap: () {
          Get.off(() => LogInPage());
        },
        text: 'Already have an account',
        text2: 'Sign In',
      ),
      body: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),

        child: Form(
          key: authController.signUpFormkey,
          child: Column(
            spacing: 30,
            children: [
              Text(
                'Create Account',
                style:
                    TextStyles.semiBold32(context, color: AppColors.black),
              ),
              SizedBox(
                height: context.heightReponsive * 0.06,
              ),
              customTextField(
                textFieldInputModel: TextFieldInputModel(
                  context: context,
                  controller: authController.signUpUsernameController,
                  textHint: 'Name',
                  validator: (value) => validateName(value),
                ),
              ),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                validator: (value) {
                  return validateEmail(value);
                },
                context: context,
                controller: authController.signUpEmailController,
                textHint: 'Email',
              )),
              Obx(() {
                return customTextField(
                    textFieldInputModel: TextFieldInputModel(
                  context: context,
                  controller: authController.signUpPasswordController,
                  textHint: 'Password',
                  validator: (value) => validatePassword(value),
                  isSecure: authController.isSecureController.value,
                  postfixIcon: authController.isSecureController.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixIconPressed: () {
                    authController.isSecureActive();
                  },
                ));
              }),
              SizedBox(height: context.heightReponsive * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioButton(title: 'Client', value: 'client'),
                  RadioButton(title: 'Coach', value: 'coach'),
                ],
              ),
              customButton(
                  customButtonInputModel: CustomButtonInputModel(
                      context: context,
                      buttonName: ViewConstants.continueButtonText,
                      onPressedFunction: () {
                        if(authController.signUpFormkey.currentState!.validate()){
                          Get.to(() => TellUsAboutYouPage());
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
