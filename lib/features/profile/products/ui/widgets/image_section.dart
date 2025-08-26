import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/features/profile/products/ui/widgets/camera_container.dart';
import 'package:souq/features/profile/products/ui/widgets/form_section.dart';

class ImageSection extends StatelessWidget {
  final Function()? onTap;
  final List<File> selectedImages;
  final String desc;

  const ImageSection({
    super.key,
    required this.selectedImages,
    required this.onTap,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: '$desc Images',
      icon: Icons.camera_alt,
      child: GestureDetector(
        onTap: onTap,
        child: AppContainer(
          verticalPadding: 30.h,
          isThereBorder: true,
          color: AppColors.inputColor,
          child: Column(
            children: [
              CameraContainer(),
              verticalSpace(12),
              Text('Add $desc photos', style: AppTextStyles.hintStyle),
              verticalSpace(8),
              Text('Upload up to 10 images', style: AppTextStyles.hintStyle),
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
