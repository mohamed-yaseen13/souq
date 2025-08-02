import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/signup/logic/cubit/signup_state.dart';

class ContinueWithGoogle extends StatelessWidget {
  final SignupState signupState;

  const ContinueWithGoogle({super.key, required this.signupState});

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
        signupState is SignupLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().signupWithGoogle();
                },
                child: Text('Continue with Google'),
              ),
      ],
    );
  }
}
