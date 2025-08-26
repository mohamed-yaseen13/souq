import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/constants/app_constants.dart';

class RoleCard extends StatelessWidget {
  final Role role;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                color: isSelected ? Colors.blue : Colors.white,
              ),
            ),
            Image.asset(
              role.imagePath,
              height: 150.h,
              width: 150.w,
              fit: BoxFit.contain,
            ),
            Text(role.desc),
          ],
        ),
      ),
    );
  }
}
