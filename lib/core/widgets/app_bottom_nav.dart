import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_bottom_nav_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.items,
    required this.children,
  });

  final List<BottomNavigationBarItem> items;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientBottomNavController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            toolbarHeight: 30,
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 35,
            backgroundColor: AppColors.white,
            elevation: 0,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.black,
            currentIndex: controller.selectedTapIndex,
            onTap: controller.onChangeTabIndex,
            items: items,
            type: BottomNavigationBarType.fixed,
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: children,
          ),
        );
      },
    );
  }
}
