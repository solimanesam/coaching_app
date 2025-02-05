import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
            spacing: 30,
            children: [
              customAppBar(
                  customAppBarInputModel: CustomAppBarInputModel(
                appBarTitle: 'Reset Password',
                context: context,
                iconButtonOnPressedFunction: () {},
              )),
              SizedBox(height: context.height * 0.06),
              Text(
                'Enter New Password',
                style: TextStyles.semiBold32(context,
                    color: AppColors.primaryColor),
              ),
              Text(
                'Your new password must be different \n from previously used password   ',
                style: TextStyles.regular16_120(context, color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                context: context,
                controller: TextEditingController(),
                textHint: 'Password',
                isSecure: true,
                postfixIcon: Icons.visibility_off_outlined,
                onSuffixIconPressed: () {},
              )),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                context: context,
                controller: TextEditingController(),
                textHint: 'Confirm Password',
                isSecure: true,
                postfixIcon: Icons.visibility_off_outlined,
                onSuffixIconPressed: () {},
              )),
              SizedBox(height: context.height * 0.06),
              customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName: "Continue",
                onPressedFunction: () {},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
