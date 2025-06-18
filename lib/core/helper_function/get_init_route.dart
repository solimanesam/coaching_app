import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';

import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_home_page.dart';
import 'package:coaching_app/features/coach_dashboard/view/pages/create_package.dart';
import 'package:coaching_app/features/payment_integration/presentation/view/pages/payment_page.dart';
import 'package:flutter/widgets.dart';

Future<Widget> get getInitRoute async {
  final String? token = await locator<BaseCache>()
      .getStringFromCache(key: CacheConstant.tokenKey);

  if (token != null) {
    final String role = (await locator<BaseCache>()
        .getStringFromCache(key: CacheConstant.roleKey))!;

    if (role == 'Client') {
      return ClientHomePage();
    } else if (role == 'Coach') {
      return CreatePackage();
    }
  }
  return PaymentMethodsPage();
}
