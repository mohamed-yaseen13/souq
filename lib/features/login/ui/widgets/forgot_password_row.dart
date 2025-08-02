import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.resetPasswordScreen);
          },
          child: Text(
            'Forgot Password ?',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4D81E7),
            ),
          ),
        ),
      ],
    );
  }
}
