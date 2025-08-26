import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/core/widgets/app_screen_template.dart';

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
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD1D5DB), width: 2.w),
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xFFF9FAFB),
              ),
              child: Column(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 20.sp,
                      color: Color(0xFF6B7280),
                    ),
                  ),
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
          Text('Your Products'),
          verticalSpace(24),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.black),
                ),
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
