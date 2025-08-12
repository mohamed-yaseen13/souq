import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class LogoutRow extends StatelessWidget {
  const LogoutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Logout', style: AppTextStyles.redColor20FontText),
        Spacer(),
        Icon(Icons.logout, size: 32.sp, color: Colors.grey),
      ],
    );
  }
}
