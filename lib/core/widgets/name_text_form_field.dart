import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController nameController;

  const NameTextFormField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: nameController,
      label: 'Name',
      validator: (value) => value!.isEmpty ? 'Enter your name' : null,
      prefixIcon: Icon(
        Icons.person_outline,
        color: nameController.text.isEmpty ? Colors.grey : AppColors.purple,
        size: 25.sp,
      ),
    );
  }
}
