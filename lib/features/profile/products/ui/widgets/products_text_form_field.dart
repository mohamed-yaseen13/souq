import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';

class ProductsTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final TextInputType? keyboardType;
  final int maxLines;
  final String placeholder;

  const ProductsTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
    this.keyboardType,
    this.isRequired = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: label),
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Color(0xFFEF4444)),
                ),
            ],
          ),
        ),
        verticalSpace(4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 2.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFF6366F1), width: 2.w),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          validator: isRequired
              ? (value) =>
                    value?.isEmpty == true ? 'This field is required' : null
              : null,
        ),
      ],
    );
  }
}
