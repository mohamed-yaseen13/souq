import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/widgets/app_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.settings,
      ),
      body: Center(child: Text('Settings')),
    );
  }
}
