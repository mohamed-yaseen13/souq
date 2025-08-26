import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/products/ui/widgets/camera_container.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      title: "Your Shop",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Shop Name'),
          verticalSpace(24),
          GestureDetector(
            onTap: () {},
            child: AppContainer(
              verticalPadding: 30.h,
              isThereBorder: true,
              color: AppColors.inputColor,
              child: Column(
                children: [
                  CameraContainer(),
                  verticalSpace(12),
                  Text(
                    'Add Your Shop Logo',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(24),
          Text('Your Bio'),
          verticalSpace(24),
          AppButton(desc: 'Edit Your Shop Info', onPressed: () {}),
          verticalSpace(24),
          Column(
            children: [
              AppContainer(
                isThereBorder: true,
                verticalPadding: 0,
                color: AppColors.inputColor,
                child: TextField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.filter_list),
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(24),
          Text('Your Products'),
          verticalSpace(24),
          AppButton(
            onPressed: () {
              context.pushNamed(AppRoutes.addProductScreen);
            },
            desc: 'Add Product',
          ),
        ],
      ),
    );
  }
}
