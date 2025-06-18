import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ListTileWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        shape: Border(bottom: BorderSide(color: AppColors.grey)),
        title: Row(
          spacing: 5,
          children: <Widget>[
            Icon(icon, color: AppColors.primaryColor),
            Text(title, style: TextStyles.semiBold32auto(context).copyWith(fontSize: 27)),
          ],
        ),
        trailing: Icon(
          CupertinoIcons.right_chevron,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
