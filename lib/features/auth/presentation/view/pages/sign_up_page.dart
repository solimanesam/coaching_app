import 'package:coaching_app/core/extentions/controllers_extention.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/helper_function/email_validate.dart';
import 'package:coaching_app/core/helper_function/name_validate.dart';
import 'package:coaching_app/core/helper_function/password_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:coaching_app/features/auth/presentation/view/components/custom_container.dart';
import 'package:coaching_app/features/auth/presentation/view/components/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        bottomNavigationBar: customNavigationbar(
          context,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false,);
          },
          text: 'Already have an account',
          text2: 'Sign In',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Form(
                  child: Column(
                    spacing: 30,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyles.semiBold32(context,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: context.height * 0.06,
                      ),
                      customTextField(
                        textFieldInputModel: TextFieldInputModel(
                          context: context,
                          controller: context.authController.usernameController,
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
                        controller: context.authController.emailController,
                        textHint: 'Email',
                      )),
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
                      SizedBox(height: context.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customContainer(
                            context,
                            text: 'Client',
                            color: state.active == 1
                                ? AppColors.black
                                : AppColors.grey,
                            onTap: () {
                              context.authController.isActive(1);
                            },
                          ),
                          customContainer(
                            context,
                            text: 'Coach',
                            color: state.active == 2
                                ? AppColors.black
                                : AppColors.grey,
                            onTap: () {
                              context.authController.isActive(2);
                            },
                          ),
                        ],
                      )
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
