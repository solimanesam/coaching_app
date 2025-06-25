import 'package:coaching_app/core/widgets/app_bottom_nav.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_home_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_package_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/subscriber_files_page.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/coach_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ClientBottomNavController controller =
        Get.find<ClientBottomNavController>();
    return AppBottomNav(items: controller.clientBottomNavigationBarItems, children: [
      const ClientHomePage(),
      const SubscriptionPlansPage(),
      const SubscriberFilesPage(),
      Text('1'),
      Text('1'),
      const CoachProfilePage()
    ]);
  }
}
