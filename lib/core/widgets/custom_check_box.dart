import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget customCheckBox({
  required CustomCheckBoxInputModel customCheckBoxInputModel,
}) {
  return SizedBox(
    width: customCheckBoxInputModel.context.widthResponsive * .80,
    child: ListTile(
      trailing: Checkbox(
        activeColor: AppColors.primaryColor,
        checkColor: AppColors.black,
        fillColor: const WidgetStatePropertyAll(AppColors.grey),
        side: const BorderSide(width: 0.0),
        value: customCheckBoxInputModel.value,
        onChanged: (value) => customCheckBoxInputModel.onChanged(), 
      ),
      leading: Text(
        customCheckBoxInputModel.checkBoxName,
        style: TextStyles.semiBold18(
          context: customCheckBoxInputModel.context,
          color: AppColors.black,
        ),
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(),
      ),
    ),
  );
}


class CustomCheckBoxInputModel {
  final String checkBoxName;
  final BuildContext context;
  final bool value;
  final VoidCallback onChanged;

  CustomCheckBoxInputModel(
      {required this.context,
      required this.checkBoxName,
      required this.value,
      required this.onChanged});
}
