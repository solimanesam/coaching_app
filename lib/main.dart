import 'package:coaching_app/core/services/app_binidings.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_theme.dart';
import 'package:coaching_app/features/splashscreen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.setupLocator();
  GetMaterialApp app = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
   // initialRoute: getInitRoute,
   // onGenerateRoute: onGenerateRoute,
    initialBinding: AppBinidings(),
    theme: appTheme,
  );
  runApp(app);
}
