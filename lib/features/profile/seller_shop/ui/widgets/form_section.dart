import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';

class FormSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const FormSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16.sp, color: const Color(0xFF374151)),
            horizontalSpace(8),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        verticalSpace(15),
        child,
      ],
    );
  }
}
