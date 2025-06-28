import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Row customRowForCapDetails({
  required BuildContext context,
  required String label,
  required String value,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      Text(
        '$label: ',
        style: TextStyles.semiBold32(context, color: AppColors.black),
      ),
      Flexible(
        child: Text(
          value,
          style: TextStyles.quarterBold32(context, color: AppColors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
