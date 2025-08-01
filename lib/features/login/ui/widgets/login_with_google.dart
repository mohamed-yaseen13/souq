import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: Color(0xFFEDF1F3), thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text('Or'),
            ),
            Expanded(child: Divider(color: Color(0xFFEDF1F3), thickness: 1)),
          ],
        ),
        verticalSpace(24),
        ElevatedButton(onPressed: () {}, child: Text('Continue with Google')),
      ],
    );
  }
}
