import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class ProductsRow extends StatelessWidget {
  const ProductsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.sellerProductsScreen);
      },
      child: Row(
        children: [
          Icon(
            Icons.production_quantity_limits,
            color: AppColors.purple,
            size: 25.sp,
          ),
          horizontalSpace(12),
          Text('Your Shop', style: AppTextStyles.blackColor18FontText),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
        ],
      ),
    );
  }
}
