import 'package:coaching_app/core/helper_function/get_init_route.dart';
import 'package:coaching_app/core/helper_function/on_generate_route.dart';
import 'package:coaching_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  GetMaterialApp app = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: getInitRoute,
    onGenerateRoute: onGenerateRoute,
    theme: appTheme,
    
  );
  runApp(app);
}
