import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Row customRowForCapDetails(
    {required BuildContext context, required String text}) {
  return Row(
    spacing: 10,
    children: [
      Text(
        'Name:',
        style: TextStyles.semiBold32(context, color: AppColors.black),
      ),
      Text(
        text,
        style: TextStyles.quarterBold32(context, color: AppColors.black),
      )
    ],
  );
}
