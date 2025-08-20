import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String?) validator;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool readOnly;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.isObscureText = false,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.blackColor18FontText),
        TextFormField(
          readOnly: readOnly,
          keyboardType: textInputType,
          obscureText: isObscureText,
          controller: controller,
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
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
