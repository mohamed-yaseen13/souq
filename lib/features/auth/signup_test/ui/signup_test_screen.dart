import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/auth/signup_test/logic/signup_test_cubit.dart';
import 'package:souq/features/auth/signup_test/ui/widgets/signup_test_form.dart';

class SignupTestScreen extends StatelessWidget {
  const SignupTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(4),
                Text(
                  'Create an account to continue!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                BlocConsumer<SignupTestCubit, SignupTestState>(
                  listener: (context, state) {
                    if (state.otpSent) {
                      context.pushNamed(
                        AppRoutes.otpScreen,
                        arguments: {'email': state.email},
                      );
                      print(state.email);
                    } else if (!state.error.isNullOrEmpty()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error.toString())),
                      );
                      print(state.error.toString());
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [SignupTestForm(signupTestState: state)],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
