import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/widgets/app_navigation_bar.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/home/ui/widgets/welcome_column.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.home,
      ),
      child: WelcomeColumn(),
    );
  }
}
