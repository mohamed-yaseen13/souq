import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';

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
                child: AppTextFormField(
                  controller: priceController,
                  label: 'Price',
                  placeholder: '0.00',
                  isRequired: true,
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AppTextFormField(
                  controller: stockController,
                  label: 'Stock Quantity',
                  placeholder: '1',
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: originalPriceController,
            label: 'Original Price',
            placeholder: 'Original price (for discounts)',
            textInputType: TextInputType.numberWithOptions(decimal: true),
          ),
        ],
      ),
    );
  }
}
