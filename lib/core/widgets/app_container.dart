import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainer extends StatelessWidget {
  final double height;
  final Color? color;
  final Widget child;

  const AppContainer({
    super.key,
    required this.height,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12.h, horizontal: 18.w),
        child: child,
      ),
    );
  }
}
