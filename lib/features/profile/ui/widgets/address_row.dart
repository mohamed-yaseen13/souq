import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key});

  @override
  Widget build(BuildContext context) {
    final String userAddress = SharedPref.getUserAddress();

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address', style: AppTextStyles.blackColor18FontText),
            verticalSpace(8),
            Text(userAddress.isNullOrEmpty() ? 'Empty' : userAddress),
          ],
        ),
        Spacer(),
        Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
      ],
    );
  }
}
