import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class OtpForm extends StatelessWidget {
  final Function(String) onCompleted;
  final VoidCallback onConfirm;
  final bool isLoading;

  const OtpForm({
    super.key,
    required this.onCompleted,
    required this.onConfirm,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12.sp),
      ),
    );

    return Column(
      children: [
        Text(
          'OTP Verification Code',
          style: AppTextStyles.orangeColor32FontText,
        ),
        verticalSpace(64),
        Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12.sp),
            ),
          ),
          showCursor: true,
          separatorBuilder: (index) => horizontalSpace(12),
          onCompleted: onCompleted,
        ),
        verticalSpace(64),
        isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: onConfirm,
                child: const Text('Confirm'),
              ),
      ],
    );
  }
}
