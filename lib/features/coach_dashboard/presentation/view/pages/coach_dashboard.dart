import 'package:coaching_app/core/widgets/app_bottom_nav.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/coach_profile_page.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/packages_page.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/subscribers_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachDashboard extends StatelessWidget {
  const CoachDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final ClientBottomNavController controller =
        Get.find<ClientBottomNavController>();
    return AppBottomNav(items: controller.coashBottomNavigationBarItems, children: [
      //PackagesPage(),
      Center(child: Text('2')),
      Center(child: Text('3')),
      SubscribersPage(),
      CoachProfilePage(),
    ]);
  }
}
