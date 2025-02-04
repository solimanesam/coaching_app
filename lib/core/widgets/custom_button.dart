import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

MaterialButton customButton(
    {required BuildContext context,
    required String text,
    required VoidCallback onPressed}) {
  return MaterialButton(
    onPressed: onPressed,
    height: context.height * 0.06,
    minWidth: context.width * 0.8,
    color: AppColors.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Text(text,
        style: TextStyles.semiBold32(context, color: AppColors.black)),
  );
}
