import 'package:flutter/material.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';
import 'package:souq/features/profile/products/ui/widgets/products_text_form_field.dart';
import 'package:souq/features/profile/products/ui/widgets/variants_row.dart';

class VariantsSection extends StatelessWidget {
  final TextEditingController colorsController;
  final TextEditingController sizesController;
  final List<String> availableColors;
  final List<String> selectedColors;
  final List<String> availableSizes;
  final List<String> selectedSizes;

  final void Function(String option) onColorSelected;
  final void Function(String option) onSizeSelected;

  const VariantsSection({
    super.key,
    required this.availableColors,
    required this.availableSizes,
    required this.colorsController,
    required this.selectedColors,
    required this.selectedSizes,
    required this.sizesController,
    required this.onColorSelected,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Variants (Optional)',
      icon: Icons.palette,
      child: Column(
        children: [
          ProductsTextFormField(
            controller: colorsController,
            label: 'Available Colors',
            placeholder: 'e.g., Red, Blue, Black',
          ),
          const SizedBox(height: 8),
          VariantsRow(
            options: availableColors,
            selected: selectedColors,
            onSelected: onColorSelected,
          ),
          const SizedBox(height: 16),
          ProductsTextFormField(
            controller: sizesController,
            label: 'Available Sizes',
            placeholder: 'e.g., S, M, L, XL',
          ),
          const SizedBox(height: 8),
          VariantsRow(
            options: availableSizes,
            selected: selectedSizes,
            onSelected: onSizeSelected,
          ),
        ],
      ),
    );
  }
}
