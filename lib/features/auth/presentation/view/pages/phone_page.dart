import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';

class UpdatePhonePage extends StatelessWidget {
  UpdatePhonePage({super.key});

  final PhoneController controller = Get.put(PhoneController());
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textFieldModel = TextFieldInputModel(
      context: context,
      controller: phoneController,
      textHint: "Phone Number",
      prefixIcon: Icons.phone,
      keyBoardType: TextInputType.phone,
      isSecure: false,
      validator: (value) {
        if (value == null || value.isEmpty) return "الرجاء إدخال رقم الهاتف";
        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) return "رقم غير صالح";
        return null;
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            children: [
              Text('Update Phone Number', style: TextStyles.semiBold32(context,color: AppColors.black)),
              customTextField(textFieldInputModel: textFieldModel),
              const SizedBox(height: 20),
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            controller.updatePhoneNumber(
                                phoneController.text.trim());
                          }
                        },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Update",
                          style: TextStyles.semiBold18(
                            context: context,
                            color: Colors.white,
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
