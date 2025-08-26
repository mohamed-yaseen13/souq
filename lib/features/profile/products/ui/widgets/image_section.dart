import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';

class ImageSection extends StatelessWidget {
  final Function()? onTap;
  final List<File> selectedImages;

  const ImageSection({
    super.key,
    required this.selectedImages,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Product Images',
      icon: Icons.camera_alt,
      child: GestureDetector(
        onTap: onTap,
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
                'Add product photos',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 14.sp),
              ),
              verticalSpace(8),
              Text(
                'Upload up to 10 images',
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.sp),
              ),
              if (selectedImages.isNotEmpty) ...[
                verticalSpace(16),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8.w),
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            image: FileImage(selectedImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
