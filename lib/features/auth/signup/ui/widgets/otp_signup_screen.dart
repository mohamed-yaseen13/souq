import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/otp_form.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_state.dart';

class OtpSignupScreen extends StatefulWidget {
  final String email;

  const OtpSignupScreen({super.key, required this.email});

  @override
  State<OtpSignupScreen> createState() => _OtpSignupScreenState();
}

class _OtpSignupScreenState extends State<OtpSignupScreen> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 4.w),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSignedUp) {
              context.pushNamed(AppRoutes.onBoardingScreen);
            } else if (state is SignupError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return OtpForm(
              email: widget.email,
              onCompleted: (value) => setState(() => otp = value),
              isLoading: state is SignupVerifyingOtp,
              onConfirm: () {
                context.read<SignupCubit>().verifyOtpThenSignup(
                  email: widget.email,
                  otp: otp,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
