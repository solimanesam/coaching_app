import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget customTextField(
    {required BuildContext context,
    required String hint,
    required IconData icon}) {
  return SizedBox(
    height: context.height * 0.06,
    child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: AppColors.grey,
            ),
            hintStyle: TextStyles.regular16_120(context, color: AppColors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.grey),
            ))),
  );
}
