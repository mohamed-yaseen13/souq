import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/signup/ui/widgets/continue_with_google.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/signup/logic/cubit/signup_state.dart';
import 'package:souq/features/signup/ui/widgets/already_have_an_account_row.dart';
import 'package:souq/features/signup/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      context.pushReplacementNamed(AppRoutes.home);
                    } else if (state is SignupError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        SignupForm(signupState: state),
                        verticalSpace(24),
                        ContinueWithGoogle(signupState: state),
                      ],
                    );
                  },
                ),
                verticalSpace(48),
                AlreadyHaveAnAccountRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
