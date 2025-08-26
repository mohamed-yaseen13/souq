import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_input_decoration.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String?)? validator;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool readOnly;
  final String? placeholder;
  final bool isRequired;
  final int maxLines;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isObscureText = false,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.placeholder,
    this.readOnly = false,
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
            style: AppTextStyles.blackColor14FontText,
            children: [
              TextSpan(text: label),
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: AppTextStyles.redColor16Font500WeightText,
                ),
            ],
          ),
        ),
        verticalSpace(4),
        TextFormField(
          readOnly: readOnly,
          keyboardType: textInputType,
          obscureText: isObscureText,
          controller: controller,
          maxLines: maxLines,
          decoration: appInputDecoration(
            hintText: placeholder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: isRequired
              ? (value) =>
                    value?.isEmpty == true ? 'This field is required' : null
              : (value) {
                  if (validator != null) {
                    return validator!(value);
                  }
                  return null;
                },
        ),
      ],
    );
  }
}
