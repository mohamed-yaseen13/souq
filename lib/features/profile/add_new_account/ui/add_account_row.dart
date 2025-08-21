import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AddAccountRow extends StatelessWidget {
  const AddAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.addNewAccountScreen);
      },
      child: Row(
        children: [
          Icon(Icons.person_add, color: AppColors.purple, size: 25.sp),
          horizontalSpace(12),
          Text('Add New Account', style: AppTextStyles.blackColor18FontText),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
        ],
      ),
    );
  }
}
