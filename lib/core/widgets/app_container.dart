import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainer extends StatelessWidget {
  final Color? color;
  final Widget child;
  final double? verticalPadding;

  const AppContainer({
    super.key,
    this.color,
    required this.child,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: verticalPadding ?? 10.h,
          horizontal: 18.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ),
      ),
    );
  }
}
