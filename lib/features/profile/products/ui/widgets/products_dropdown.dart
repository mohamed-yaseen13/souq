import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_input_decoration.dart';

class ProductsDropdown extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const ProductsDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.value,
    this.isRequired = false,
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
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: appInputDecoration(),
          items: items.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          validator: isRequired
              ? (value) => value == null ? 'Please select an option' : null
              : null,
        ),
      ],
    );
  }
}
