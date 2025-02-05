import 'package:coaching_app/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:coaching_app/features/splashscreen/view/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    
    // case "login":
    //   return MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => const LogInPage(),
    //   );
    // case 'signUp':
    //   return MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => const SignUpPage(),
    //   );
      case 'splash':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      );
      case 'forgetpassword':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>const  ForgetPasswordPage(),
      );
      // case 'dashboard':
      // return MaterialPageRoute<dynamic>(
      //   builder: (BuildContext context) => const DashboardPage(),
      // );
      
    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      );
  }
}
