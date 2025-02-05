import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget customContainer(BuildContext context, {required String text , required Color color,required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color:color),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.semiBold32(context, color: AppColors.black),
        ),
      ),
    ),
  );
}
