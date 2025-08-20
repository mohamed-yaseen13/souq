import 'package:flutter/material.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AlreadyHaveAnAccountRow extends StatelessWidget {
  const AlreadyHaveAnAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppTextStyles.greyColor12Font500WeightText,
        ),
        horizontalSpace(4),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.loginScreen);
          },
          child: Text(
            'Login',
            style: AppTextStyles.blueColor12Font500WeightText,
          ),
        ),
      ],
    );
  }
}
