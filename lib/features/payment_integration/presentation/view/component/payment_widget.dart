import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Row paymentOptionField(
    {required String label, required BuildContext context, required Function() onTap}) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: label,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      TextButton(
        onPressed: () => onTap(),
        child: Text(
          'Link',
          style:
              TextStyles.regular16_120(context, color: AppColors.primaryColor),
        ),
      ),
    ],
  );
}
