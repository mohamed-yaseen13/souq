import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_container.dart';

class PictureAndNameContainer extends StatelessWidget {
  const PictureAndNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = SharedPref.getUserName();
    final String userRole = SharedPref.getUserRole();
    final String userEmail = SharedPref.getUserEmail();

    return AppContainer(
      height: 100,
      color: AppColors.green,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.sp,
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/sell.png'),
          ),
          horizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$userRole $userName',
                style: AppTextStyles.whiteColor20FontText,
              ),
              verticalSpace(4),
              Text(userEmail),
            ],
          ),
          Spacer(),
          Icon(Icons.edit, color: Colors.white),
        ],
      ),
    );
  }
}
