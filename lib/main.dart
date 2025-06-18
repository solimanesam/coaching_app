import 'package:coaching_app/core/constants/secret_keys.dart';
import 'package:coaching_app/core/services/app_binidings.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/services/payment_dependency_injection.dart';
import 'package:coaching_app/core/theme/app_theme.dart';
import 'package:coaching_app/features/splashscreen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.setupLocator();
  PaymentDependencyInjection.init();
  await locator<BaseCache>().cacheInitialization();
  Stripe.publishableKey = SecretKeys.stripePublishKey;

  GetMaterialApp app = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    initialBinding: AppBinidings(),
    theme: appTheme,
  );
  runApp(app);
}
