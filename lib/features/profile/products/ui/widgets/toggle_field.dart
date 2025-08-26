import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';

class ToggleField extends StatelessWidget {
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleField({
    super.key,
    required this.description,
    required this.label,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 2.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: TextStyle(color: Color(0xFF374151), fontSize: 14.sp),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: const Color(0xFF6366F1),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
