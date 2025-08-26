import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';

InputDecoration appInputDecoration({
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkPurple, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    hintStyle: AppTextStyles.hintStyle,
    hintText: hintText,
  );
}
