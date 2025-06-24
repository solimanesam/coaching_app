import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_bottom_nav.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/coach_dashboard.dart';
import 'package:flutter/widgets.dart';

Future<Widget> get getInitRoute async {
  final String? token = await locator<BaseCache>()
      .getStringFromCache(key: CacheConstant.tokenKey);

  if (token != null) {
    final String role = (await locator<BaseCache>()
        .getStringFromCache(key: CacheConstant.roleKey))!;

    if (role == 'User') {
      return ClientDashboard();
    } else if (role == 'Coach') {
      return CoachDashboard();
    }
  }
  return LogInPage();
}
