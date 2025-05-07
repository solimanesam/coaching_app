import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

IconButton arrowBackButton({required Function() onPressed}) => IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_circle_left,
        color: AppColors.black,
        size: 30,
      ),
    );
