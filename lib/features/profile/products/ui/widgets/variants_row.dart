import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VariantsRow extends StatelessWidget {
  final List<String> options;
  final List<String> selected;
  final void Function(String option) onSelected;

  const VariantsRow({
    super.key,
    required this.onSelected,
    required this.options,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.w,
      children: options.map((option) {
        final isSelected = selected.contains(option);
        return GestureDetector(
          onTap: () => onSelected(option),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF6366F1)
                  : const Color(0xFFF3F4F6),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF6366F1)
                    : const Color(0xFFD1D5DB),
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF374151),
                fontSize: 12.sp,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
