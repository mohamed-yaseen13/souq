import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';

class ProductsDropdown extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const ProductsDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.value,
    this.isRequired = false,
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
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
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
          items: items.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          validator: isRequired
              ? (value) => value == null ? 'Please select an option' : null
              : null,
        ),
      ],
    );
  }
}
