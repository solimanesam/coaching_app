import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left,
            color: AppColors.black,
            size: 30,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(left: 30,bottom: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 40,
            children: [
              Text(
                'Password Manager',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      postfixIcon: Icons.visibility_off_outlined,
                      controller: TextEditingController(),
                      textHint: 'current password')),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      postfixIcon: Icons.visibility_off_outlined,
                      controller: TextEditingController(),
                      textHint: 'new password')),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      postfixIcon: Icons.visibility_off_outlined,
                      controller: TextEditingController(),
                      textHint: 'confirm new password')),
                      Spacer(),
              customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName: 'Change Password',
                onPressedFunction: () {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}
