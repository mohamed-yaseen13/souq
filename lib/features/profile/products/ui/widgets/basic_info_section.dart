import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';
import 'package:souq/features/profile/products/ui/widgets/products_dropdown.dart';

class BasicInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController brandController;
  final String? selectedCategory;
  final List<String> categories;
  final String? selectedCondition;
  final List<String> conditions;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onConditionChanged;

  const BasicInfoSection({
    super.key,
    required this.brandController,
    required this.categories,
    required this.conditions,
    required this.descriptionController,
    required this.nameController,
    required this.onCategoryChanged,
    required this.onConditionChanged,
    required this.selectedCategory,
    required this.selectedCondition,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Basic Information',
      icon: Icons.edit_note,
      child: Column(
        children: [
          AppTextFormField(
            controller: nameController,
            label: 'Product Name',
            placeholder: 'Enter product name',
            isRequired: true,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: descriptionController,
            label: 'Description',
            placeholder: 'Describe your product in detail...',
            isRequired: true,
            maxLines: 4,
          ),
          verticalSpace(16),
          ProductsDropdown(
            label: 'Category',
            value: selectedCategory,
            items: categories,
            onChanged: onCategoryChanged,
            isRequired: true,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: brandController,
            label: 'Brand',
            placeholder: 'Product brand',
          ),
          verticalSpace(16),
          ProductsDropdown(
            label: 'Condition',
            value: selectedCondition,
            items: conditions,
            onChanged: onConditionChanged,
            isRequired: true,
          ),
        ],
      ),
    );
  }
}
