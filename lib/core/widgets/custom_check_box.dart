import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget customCheckBox(
    {required CustomCheckBoxInputModel customCheckBoxInputModel}) {
  return SizedBox(width: customCheckBoxInputModel.context.width * .80,
    child: ListTile(
        trailing: Checkbox(
          activeColor: AppColors.primaryColor,
          checkColor: AppColors.black,
          fillColor: WidgetStatePropertyAll(AppColors.grey),
          side: BorderSide(width: 0.0),
           
          value: false,
          onChanged: (value) {},
        ),
        leading: Text(
          customCheckBoxInputModel.checkBoxName,
          style: TextStyles.semiBold18(customCheckBoxInputModel.context,),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15), side: BorderSide())),
  );
}

class CustomCheckBoxInputModel {
  final String checkBoxName;
  final BuildContext context;

  CustomCheckBoxInputModel({required this.context, required this.checkBoxName});
}
