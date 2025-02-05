import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تأخير الانتقال بعد 2 ثانية
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'forgetpassword',
        (route) => false,
      );
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
