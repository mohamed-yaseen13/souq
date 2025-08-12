import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AddAccountRow extends StatelessWidget {
  const AddAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Add New Account', style: AppTextStyles.blackColor18FontText),
        Spacer(),
        Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
      ],
    );
  }
}
