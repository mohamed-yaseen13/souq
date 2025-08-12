import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenTemplate extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;

  const AppScreenTemplate({
    super.key,
    required this.child,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 24.h,
            horizontal: 18.w,
          ),
          child: SingleChildScrollView(child: child),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
