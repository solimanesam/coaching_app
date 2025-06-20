import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Container requestContainer({
  required BuildContext context,
  required String text1,
  required String text2,
  required String buttonName1,
  required String buttonName2,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grey, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text1,
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
          Text(
            text2,
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          miniButton(context: context, onTap: () {}, name: buttonName1),
          miniButton(context: context, onTap: () {}, name: buttonName2),
        ])
      ],
    ),
  );
}

MaterialButton miniButton(
    {required BuildContext context,
    required Function() onTap,
    required String name}) {
  {
    return MaterialButton(
        onPressed: () => onTap,
        color: AppColors.primaryColor,
        minWidth: context.widthResponsive * .2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          name,
          style: TextStyles.semiBold20(context, color: AppColors.black),
        ));
  }
}
