import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class PhoneNumberRow extends StatelessWidget {
  const PhoneNumberRow({super.key});

  @override
  Widget build(BuildContext context) {
    final userPhoneNumber = SharedPref.getUserPhoneNumber();

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone number', style: AppTextStyles.blackColor18FontText),
            verticalSpace(8),
            Text(userPhoneNumber.isNullOrEmpty() ? 'Empty' : userPhoneNumber),
          ],
        ),
        Spacer(),
        Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
      ],
    );
  }
}
