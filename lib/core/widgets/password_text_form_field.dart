import 'package:flutter/material.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordTextFormField({super.key, required this.passwordController});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isObscureText: isObscureText,
      controller: widget.passwordController,
      label: 'Password',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
