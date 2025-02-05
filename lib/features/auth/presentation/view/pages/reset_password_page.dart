import 'package:coaching_app/core/extentions/controllers_extention.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/helper_function/password_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Form(
                  key: context.authController.formkey,
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
                        style: TextStyles.regular16_120(context,
                            color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                      customTextField(
                          textFieldInputModel: TextFieldInputModel(
                        context: context,
                        controller: context.authController.passwordController,
                        textHint: 'Password',
                        validator: (value) => validatePassword(value),
                        isSecure: state.isSecure,
                        postfixIcon: state.isSecure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixIconPressed: () {
                          context.authController.isSecureActive(state.isSecure);
                        },
                      )),
                      customTextField(
                          textFieldInputModel: TextFieldInputModel(
                        context: context,
                        controller:
                            context.authController.confirmPasswordController,
                        validator: (value) => validatePassword(value),
                        textHint: 'Confirm Password',
                        isSecure: state.isSecure,
                        postfixIcon: state.isSecure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixIconPressed: () {
                          context.authController.isSecureActive(state.isSecure);
                        },
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
