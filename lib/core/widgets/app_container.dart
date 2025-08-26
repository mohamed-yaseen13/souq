import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_colors.dart';

class AppContainer extends StatelessWidget {
  final Color? color;
  final Widget child;
  final double? verticalPadding;
  final bool isThereBorder;

  const AppContainer({
    super.key,
    this.color,
    required this.child,
    this.verticalPadding,
    this.isThereBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(
        vertical: verticalPadding ?? 10.h,
        horizontal: 18.w,
      ),
      decoration: BoxDecoration(
        border: isThereBorder
            ? Border.all(color: AppColors.borderColor, width: 2.w)
            : null,
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [child],
      ),
    );
  }
}
