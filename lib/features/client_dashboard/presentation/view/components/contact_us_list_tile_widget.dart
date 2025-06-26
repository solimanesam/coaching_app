import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget contactUsListTileWidget({
  required IconData icon,
  required String title,
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: AppColors.grey, width: .65),
      ),
      title: Row(
        children: <Widget>[
          Icon(icon, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Text(title, style: TextStyles.semiBold32auto(context)),
        ],
      ),
    ),
  );
}

