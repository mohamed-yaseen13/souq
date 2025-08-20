import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController emailController;
  final bool readOnly;

  const EmailTextFormField({
    super.key,
    required this.emailController,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      readOnly: readOnly,
      textInputType: TextInputType.emailAddress,
      controller: emailController,
      label: 'Email',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your email';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
      prefixIcon: Icon(
        Icons.mail_outline_outlined,
        color: emailController.text.isEmpty ? Colors.grey : AppColors.purple,
        size: 25.sp,
      ),
    );
  }
}
