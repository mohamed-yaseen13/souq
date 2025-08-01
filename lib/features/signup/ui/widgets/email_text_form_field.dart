import 'package:flutter/material.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailTextFormField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
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
    );
  }
}
