import 'package:coaching_app/features/client_dashboard/presentation/view/components/list_tile_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> settingsOptions = [
  {
    'icon': Icons.vpn_key_outlined,
    'title': 'Password Manager',
  },
  {
    'icon': Icons.delete_outline,
    'title': 'Delete Account',
  },
];
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            settingsOptions.length,
            (index) => ListTileWidget(
                icon: settingsOptions[index]['icon'],
                title: settingsOptions[index]['title']),
          )
        ],
      ),
    );
  }
}
