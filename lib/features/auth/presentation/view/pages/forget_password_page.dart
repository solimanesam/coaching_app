import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          spacing: 30,
          children: [
            customAppBar(
                customAppBarInputModel: CustomAppBarInputModel(
              appBarTitle: 'Forget Password',
              context: context,
              iconButtonOnPressedFunction: () {},
            )),
            SizedBox(height: context.height * 0.06),
            Text(
              'Mail Address',
              style:
                  TextStyles.semiBold32(context, color: AppColors.primaryColor),
            ),
            Text(
              'Enter the email address associated \n with your account',
              style: TextStyles.regular16_120(context, color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            customTextField(
                textFieldInputModel: TextFieldInputModel(
                    context: context,
                    controller: TextEditingController(),
                    textHint: 'Email',
                    prefixIcon: Icons.email_outlined)),
            SizedBox(height: context.height * 0.06),
            customButton(
                customButtonInputModel: CustomButtonInputModel(
              context: context,
              buttonName: 'Recover Password',
              onPressedFunction: () {},
            )),
          ],
        ),
      ),
    );
  }
}
