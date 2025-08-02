import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/features/reset_password/logic/cubit/reset_password_cubit.dart';
import 'package:souq/features/reset_password/logic/cubit/reset_password_state.dart';
import 'package:souq/features/reset_password/ui/widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email Have Sent to Reset The Password',
                          ),
                        ),
                      );
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return ResetPasswordForm(resetPasswordState: state);
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
