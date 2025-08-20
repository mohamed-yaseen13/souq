import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String desc;

  const AppDialog({super.key, required this.desc, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context, false),
                  child: Icon(Icons.close, color: Colors.black, size: 24.sp),
                ),
              ],
            ),
            verticalSpace(16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.blackColor18Font600Weight1_5HeightText,
            ),
            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: AppButton(
                onPressed: () => Navigator.pop(context, false),
                desc: "Cancel",
              ),
            ),
            verticalSpace(16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  desc,
                  style: AppTextStyles.redColor16Font500WeightText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
