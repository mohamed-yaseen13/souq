import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/form_section.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/toggle_field.dart';

class ShippingSection extends StatelessWidget {
  final TextEditingController weightController;
  final TextEditingController shippingCostController;
  final bool freeShipping;
  final ValueChanged<bool?> onChanged;

  const ShippingSection({
    super.key,
    required this.freeShipping,
    required this.onChanged,
    required this.shippingCostController,
    required this.weightController,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Shipping Information',
      icon: Icons.local_shipping,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: weightController,
                  label: 'Weight (kg)',
                  placeholder: '0.5',
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AppTextFormField(
                  controller: shippingCostController,
                  label: 'Shipping Cost',
                  placeholder: '9.99',
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          ToggleField(
            label: 'Free Shipping',
            description: 'Offer free shipping',
            value: freeShipping,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
