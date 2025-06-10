import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return InkWell(
        onTap: () => controller.changeUserType(value),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: controller.getUserType,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                controller.changeUserType(value!);
              },
            ),
            SizedBox(
              width: 2,
            ),
            Text(title , style: TextStyles.semiBold20(context, color: AppColors.black),),
          ],
        ),
      );
    });
  }
}
