import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_button.dart';

class OtpForm extends StatelessWidget {
  final Function(String) onCompleted;
  final VoidCallback onConfirm;
  final bool isLoading;
  final String email;

  const OtpForm({
    super.key,
    required this.onCompleted,
    required this.onConfirm,
    this.isLoading = false,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    return Column(
      children: [
        CircleAvatar(
          radius: 70.r,
          backgroundColor: AppColors.lightPurple,
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.purple,
            child: Icon(Icons.mail_lock, color: Colors.white, size: 40.sp),
          ),
        ),
        verticalSpace(12),
        Text('Verification Code', style: AppTextStyles.blackColor32FontText),
        verticalSpace(4),
        Text(
          'We have sent a verification code to',
          style: AppTextStyles.greyColor12Font500WeightText,
        ),
        verticalSpace(4),
        Text(email, style: AppTextStyles.blackColor14FontText),
        verticalSpace(32),
        Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.purple),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          showCursor: true,
          separatorBuilder: (index) => horizontalSpace(12),
          onCompleted: onCompleted,
        ),
        verticalSpace(64),
        isLoading
            ? const CircularProgressIndicator()
            : AppButton(desc: 'Submit', onPressed: onConfirm),
      ],
    );
  }
}
