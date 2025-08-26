// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.purple, AppColors.darkPurple],
          ),
        ),
      ),
      leading: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8.sp),
          child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(title, style: AppTextStyles.whiteColor18Font600WeightText),
      centerTitle: true,
    );
  }
}
