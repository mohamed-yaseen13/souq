import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/constants/app_constants.dart';

class RoleDropDown extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final String? selectedRole;

  const RoleDropDown({
    super.key,
    required this.onChanged,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select a Role'),
        DropdownButtonFormField<String>(
          value: selectedRole,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEDF1F3), width: 2.sp),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEDF1F3), width: 2.sp),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.sp),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.sp),
              borderRadius: BorderRadius.circular(12.sp),
            ),
          ),
          items: AppConstants.roles.map((role) {
            return DropdownMenuItem(value: role, child: Text(role));
          }).toList(),
          onChanged: onChanged,
          validator: (value) => value == null ? 'Select a role' : null,
        ),
      ],
    );
  }
}
