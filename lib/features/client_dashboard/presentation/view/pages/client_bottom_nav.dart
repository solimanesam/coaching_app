import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientBottomNavController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 35,
            backgroundColor: AppColors.white,
            elevation: 0,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.black,
            currentIndex: controller.selectedTapIndex,
            onTap: controller.onChangeTabIndex,
            items: controller.bottomNavigationBarItems,
            type: BottomNavigationBarType.fixed,
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              ClientHomePage(),
              Center(child: Text('2')),
              Center(child: Text('3')),
              Center(child: Text('4')),
              Center(child: Text('5')),
            ],
          ),
        );
      },
    );
  }
}
