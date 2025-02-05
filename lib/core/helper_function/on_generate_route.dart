import 'package:coaching_app/features/auth/presentation/view/pages/choose_your_goal_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/fill_your_profile_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/reset_password_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/sign_up_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/choose_your_gender_page.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/tell_us_about_you_page.dart';
import 'package:coaching_app/features/splashscreen/view/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    
    // case "login":
    //   return MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => const LogInPage(),
    //   );
    case 'signUp':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SignUpPage(),
      );
      case 'login':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const LogInPage(),
      );
      case 'splash':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      );
      case 'forgetpassword':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>const  ForgetPasswordPage(),
      );
      case 'resetpassword':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>const  ResetPasswordPage(),
      );
      // case 'dashboard':
      // return MaterialPageRoute<dynamic>(
      //   builder: (BuildContext context) => const DashboardPage(),
      // );
      //client informations pages
      case 'TellUsAboutYouPage':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const TellUsAboutYouPage(),
      );
      case 'ChooseYourGenderPage':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const ChooseYourGenderPage(),
      );
      case 'ChooseYourGoalPage':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const ChooseYourGoalPage(),
      );
      case 'FillYourProfilePage':
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const FillYourProfilePage(),
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      );
  }
}
