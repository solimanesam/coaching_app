import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

MaterialButton customButton(
    {required CustomButtonInputModel customButtonInputModel}) {
  return MaterialButton(
    onPressed: customButtonInputModel.onPressedFunction,
    height: customButtonInputModel.context.heightReponsive * 0.06,
    minWidth: customButtonInputModel.width ?? customButtonInputModel.context.widthResponsive * 0.8,
    color: AppColors.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Text(customButtonInputModel.buttonName,
        style: TextStyles.semiBold32(customButtonInputModel.context,
            color: AppColors.black)),
  );
}

class CustomButtonInputModel {
  final BuildContext context;
  final String buttonName;
  final VoidCallback onPressedFunction;
  final double? width;
  CustomButtonInputModel(
      {required this.context,
      this.width,
      required this.buttonName,
      required this.onPressedFunction});
}
