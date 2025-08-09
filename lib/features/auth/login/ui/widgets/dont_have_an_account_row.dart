import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';

class DontHaveAnAccountRow extends StatelessWidget {
  const DontHaveAnAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        horizontalSpace(4),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.signupScreen);
          },
          child: Text(
            'Sign Up',
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
