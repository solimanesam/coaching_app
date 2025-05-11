import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/coach_dashboard/view/pages/earnings_and_performance_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   'helpcenter',
      //   (route) => false,
      // );
      Get.to(() => EarningsAndPerformancePage());
      
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
