import 'package:flutter/material.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = SharedPref.getUserName();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Souq', style: AppTextStyles.orangeColor32FontText),
        verticalSpace(16),
        Text('Hi, $userName', style: AppTextStyles.greenColor24FontText),
      ],
    );
  }
}
