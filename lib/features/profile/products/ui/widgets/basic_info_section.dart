import 'package:flutter/material.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';
import 'package:souq/features/profile/products/ui/widgets/products_dropdown.dart';
import 'package:souq/features/profile/products/ui/widgets/products_text_form_field.dart';

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
          ProductsTextFormField(
            controller: nameController,
            label: 'Product Name',
            placeholder: 'Enter product name',
            isRequired: true,
          ),
          const SizedBox(height: 16),
          ProductsTextFormField(
            controller: descriptionController,
            label: 'Description',
            placeholder: 'Describe your product in detail...',
            isRequired: true,
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          ProductsDropdown(
            label: 'Category',
            value: selectedCategory,
            items: categories,
            onChanged: onCategoryChanged,
            isRequired: true,
          ),
          const SizedBox(height: 16),
          ProductsTextFormField(
            controller: brandController,
            label: 'Brand',
            placeholder: 'Product brand',
          ),
          const SizedBox(height: 16),
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
