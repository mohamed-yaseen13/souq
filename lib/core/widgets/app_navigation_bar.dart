import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';

class AppNavigationBar extends StatefulWidget {
  final NavigationBarEnum selectedScreen;

  const AppNavigationBar({super.key, required this.selectedScreen});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _enumToIndex(NavigationBarEnum screen) {
    return NavigationBarEnum.values.indexOf(screen);
  }

  NavigationBarEnum _indexToEnum(int index) {
    return NavigationBarEnum.values[index];
  }

  String _enumToRoute(NavigationBarEnum screen) {
    switch (screen) {
      case NavigationBarEnum.orders:
        return AppRoutes.ordersScreen;
      case NavigationBarEnum.chat:
        return AppRoutes.chatsScreen;
      case NavigationBarEnum.home:
        return AppRoutes.home;
      case NavigationBarEnum.profile:
        return AppRoutes.profileScreen;
      case NavigationBarEnum.settings:
        return AppRoutes.settingsScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.production_quantity_limits),
          selectedIcon: Icon(
            Icons.production_quantity_limits,
            color: AppColors.purple,
          ),
          label: 'Orders',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat),
          selectedIcon: Icon(Icons.chat, color: AppColors.purple),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home, color: AppColors.purple),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          selectedIcon: Icon(Icons.person, color: AppColors.purple),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings, color: AppColors.purple),
          label: 'Settings',
        ),
      ],
      selectedIndex: _enumToIndex(widget.selectedScreen),
      onDestinationSelected: (index) {
        final selected = _indexToEnum(index);

        if (selected != widget.selectedScreen) {
          context.pushReplacementNamed(_enumToRoute(selected));
        }
      },
      backgroundColor: AppColors.white,
      indicatorColor: AppColors.white,
    );
  }
}
