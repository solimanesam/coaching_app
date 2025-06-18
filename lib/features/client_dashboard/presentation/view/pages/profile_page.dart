import 'package:coaching_app/core/widgets/profile_image_widget.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/list_tile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> profileOptions = [
      {
        'icon': Icons.person_outline,
        'title': 'Your profile',
      },
      {
        'icon': Icons.settings_outlined,
        'title': 'Settings',
      },
      {
        'icon': Icons.lock_outline,
        'title': 'Help center',
      },
      {
        'icon': Icons.logout,
        'title': 'Log out',
      },
    ];
    return Scaffold(
      body: Column(
        children: [
          ProfileImageWidget(),
          ...List.generate(
            profileOptions.length,
            (index) => ListTileWidget(
                icon: profileOptions[index]['icon'],
                title: profileOptions[index]['title']),
          )
        ],
      ),
    );
  }
}
