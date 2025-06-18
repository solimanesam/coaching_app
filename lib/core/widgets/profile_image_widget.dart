import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: AppColors.grey,
          child: Icon(
            Icons.person,
            color: AppColors.white,
            size: 70,
          ),
        ),
        Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Icon(Icons.image),
            )),
      ],
    );
  }
}