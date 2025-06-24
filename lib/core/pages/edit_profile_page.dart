import 'package:coaching_app/core/helper_function/email_validate.dart';
import 'package:coaching_app/core/helper_function/name_validate.dart';
import 'package:coaching_app/core/helper_function/number_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {
          Get.back();
          profileController.emailController.clear();
          profileController.userNameController.clear();
          profileController.weightController.clear();
          profileController.heightController.clear();
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Form(
          key: profileController.editProfileFormkey,
          child: Column(
            spacing: 30,
            children: [
              Text(
                'Edit Profile',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      controller: profileController.userNameController,
                      validator: (value) => validateName(value),
                      textHint: 'User Name')),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      controller: profileController.emailController,
                      validator: (value) => validateEmail(value),
                      textHint: 'Email')),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      controller: profileController.weightController,
                      validator: (value) => validateNumber(value),
                      textHint: 'Weight')),
              customTextField(
                  textFieldInputModel: TextFieldInputModel(
                      context: context,
                      controller: profileController.heightController,
                      validator: (value) => validateNumber(value),
                      textHint: 'Height')),
              Spacer(),
              GetBuilder<ProfileController>(builder: (controller) {
                return customButton(
                    customButtonInputModel: CustomButtonInputModel(
                        context: context,
                        buttonName: controller.editProfileState ==
                                RequestStateEnum.loading
                            ? 'Loading...'
                            : 'Save',
                        onPressedFunction: () {
                          profileController.editProfile();
                        }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
