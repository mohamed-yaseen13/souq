import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';

class AppScreenTemplate extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final String? title;

  const AppScreenTemplate({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title.isNullOrEmpty() ? null : CustomAppBar(title: title!),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 24.h,
            horizontal: 18.w,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(child: child),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
