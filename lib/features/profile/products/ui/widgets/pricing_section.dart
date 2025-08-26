import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';
import 'package:souq/features/profile/products/ui/widgets/products_text_form_field.dart';

class PricingSection extends StatelessWidget {
  final TextEditingController priceController;
  final TextEditingController stockController;
  final TextEditingController originalPriceController;

  const PricingSection({
    super.key,
    required this.originalPriceController,
    required this.priceController,
    required this.stockController,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Pricing & Stock',
      icon: Icons.attach_money,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ProductsTextFormField(
                  controller: priceController,
                  label: 'Price',
                  placeholder: '0.00',
                  isRequired: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: ProductsTextFormField(
                  controller: stockController,
                  label: 'Stock Quantity',
                  placeholder: '1',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          ProductsTextFormField(
            controller: originalPriceController,
            label: 'Original Price',
            placeholder: 'Original price (for discounts)',
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ],
      ),
    );
  }
}
