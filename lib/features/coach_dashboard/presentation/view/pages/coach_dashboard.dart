import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/widgets/app_bottom_nav.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/coach_profile_page.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/my_packages.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/subscribers_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachDashboard extends StatelessWidget {
  const CoachDashboard({super.key});

  Future<String?> _getCoachName() async {
    return await locator<BaseCache>().getStringFromCache(
      key: CacheConstant.userNameKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ClientBottomNavController controller =
        Get.find<ClientBottomNavController>();

    return FutureBuilder<String?>(
      future: _getCoachName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('حدث خطأ: ${snapshot.error}')),
          );
        } else {
          final coachName = snapshot.data ?? 'Coach';

          return AppBottomNav(
            items: controller.coashBottomNavigationBarItems,
            children: [
              MyPackages(coashName: coachName),
              const SubscribersPage(),
              const CoachProfilePage(),
            ],
          );
        }
      },
    );
  }
}
