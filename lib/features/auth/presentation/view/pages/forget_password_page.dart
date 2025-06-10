import 'package:coaching_app/core/helper_function/email_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Form(
              key: authController.forgetPassFormkey,
              child: Column(
                spacing: 30,
                children: [
                  customAppBar(
                      customAppBarInputModel: CustomAppBarInputModel(
                    appBarTitle: 'Forget Password',
                    context: context,
                    iconButtonOnPressedFunction: () {
                      Navigator.pop(context);
                    },
                  )),
                  SizedBox(height: context.height * 0.06),
                  Text(
                    'Mail Address',
                    style: TextStyles.semiBold32(context,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    'Enter the email address associated \n with your account',
                    style: TextStyles.regular16_120(context,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  customTextField(
                      textFieldInputModel: TextFieldInputModel(
                          validator: (value) {
                            return validateEmail(value);
                          },
                          //  textInputFormatter: getEmailInputFormats,
                          context: context,
                          controller: authController.forgetPassEmailController,
                          textHint: 'Email',
                          prefixIcon: Icons.email_outlined)),
                  SizedBox(height: context.height * 0.06),
                  GetBuilder<AuthController>(builder: (controller) {
                    return customButton(
                        customButtonInputModel: CustomButtonInputModel(
                      context: context,
                      buttonName: controller.forgetPasswordState ==
                              RequestStateEnum.loading
                          ? 'Loading...'
                          : 'Recover Password',
                      onPressedFunction: () {
                        controller.forgetPassword();
                      },
                    ));
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
