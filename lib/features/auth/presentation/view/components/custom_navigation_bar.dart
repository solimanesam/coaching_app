import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Padding customNavigationbar(BuildContext context,{required String text,required Function() onTap,required String text2}) {
  return Padding(
      padding: EdgeInsets.only(bottom: 20, left: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
          TextButton(
              onPressed: onTap,
              child: Text(
                text2,
                style: TextStyles.semiBold20(context,
                    color: AppColors.primaryColor),
              ))
        ],
      ));
}
