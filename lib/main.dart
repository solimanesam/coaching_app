import 'package:coaching_app/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/gender_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/reset_password_page.dart';
import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GenderPage(),
  );
  runApp(app);
}
