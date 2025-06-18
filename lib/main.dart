import 'package:coaching_app/core/helper_function/get_init_route.dart';
import 'package:coaching_app/core/helper_function/on_generate_route.dart';
import 'package:coaching_app/core/theme/app_theme.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/profile_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SettingsPage(),
    onGenerateRoute: onGenerateRoute,
    theme: appTheme,
    
  );
  runApp(app);
}
