import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/form_section.dart';

class AdditionalDetailsSection extends StatelessWidget {
  final TextEditingController warrantyController;
  final TextEditingController returnPolicyController;

  const AdditionalDetailsSection({
    super.key,
    required this.returnPolicyController,
    required this.warrantyController,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Additional Details',
      icon: Icons.info_outline,
      child: Column(
        children: [
          AppTextFormField(
            controller: warrantyController,
            label: 'Warranty Information',
            placeholder: 'e.g., 1 year manufacturer warranty',
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: returnPolicyController,
            label: 'Return Policy',
            placeholder: 'Describe your return policy...',
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
