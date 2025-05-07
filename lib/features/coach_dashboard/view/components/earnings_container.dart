import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Row earningsContainer({required BuildContext context, required String text}) {
  return Row(
    children: [
      Spacer(),
      Container(
        width: context.width * 0.5,
        height: context.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyles.quarterBold25(context, color: AppColors.black),
        ),
      )
    ],
  );
}
