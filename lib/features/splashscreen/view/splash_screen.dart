import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => SignUpPage());
    });

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primaryColor,
      child: Center(
        child: Image.asset('assets/splash.jpeg'),
      ),
    );
  }
}
