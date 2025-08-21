import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/services/image_service.dart';

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
        Row(
          children: [
            CircleAvatar(
              radius: 25.sp,
              backgroundColor: Colors.white,
              child: ClipOval(child: ImageService.getUserImage()),
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName',
                  style: AppTextStyles.blackColor18FontText,
                ),
                verticalSpace(4),
                Text(
                  "Let's go shopping",
                  style: AppTextStyles.greyColor12Font500WeightText,
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/icons/search_icon.png',
              color: AppColors.black,
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpace(12),
            Icon(Icons.notifications_none, size: 25.sp),
          ],
        ),
      ],
    );
  }
}
