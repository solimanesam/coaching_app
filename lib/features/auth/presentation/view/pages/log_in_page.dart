import 'package:coaching_app/core/helper_function/email_validate.dart';
import 'package:coaching_app/core/helper_function/password_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/view/components/custom_navigation_bar.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      bottomNavigationBar: customNavigationbar(
        context,
        onTap: () {
          Get.off(() => SignUpPage());
        },
        text: 'dont have an account',
        text2: 'Sign Up',
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: authController.logInFormkey,
              child: Column(
                spacing: 30,
                children: [
                  Text(
                    'Sign In',
                    style:
                        TextStyles.semiBold32(context, color: AppColors.black),
                  ),
                  SizedBox(
                    height: context.height * 0.06,
                  ),
                  customTextField(
                      textFieldInputModel: TextFieldInputModel(
                    validator: (value) {
                      return validateEmail(value);
                    },
                    context: context,
                    controller: authController.logInEmailController,
                    textHint: 'Email',
                  )),
                  Column(
                    children: [
                      Obx(() => customTextField(
                              textFieldInputModel: TextFieldInputModel(
                            context: context,
                            controller: authController.logInPasswordController,
                            textHint: 'Password',
                            validator: (value) => validatePassword(value),
                            isSecure: authController.isSecureController.value,
                            postfixIcon: authController.isSecureController.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            onSuffixIconPressed: () {
                              authController.isSecureActive();
                            },
                          ))),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.to(()=> ForgetPasswordPage());
                            },
                            child: Text(
                              'Forget Password ?',
                              style: TextStyles.semiBold16(context,
                                  color: AppColors.primaryColor),
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: context.height * 0.03),
                  GetBuilder<AuthController>(
                    builder: (cont) {
                      return customButton(
                          customButtonInputModel: CustomButtonInputModel(
                        context: context,
                        buttonName:cont.logInState == RequestStateEnum.loading ? "Loading..." : 'Sign In',
                        onPressedFunction: () {
                          authController.logIn();
                        },
                      ));
                    }
                  )
                ],
              ),
            )),
      ),
    );
  }
  
}
