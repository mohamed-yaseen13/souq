import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/otp_form.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/auth/login/logic/cubit/login_state.dart';

class OtpLoginScreen extends StatefulWidget {
  final String email;

  const OtpLoginScreen({super.key, required this.email});

  @override
  State<OtpLoginScreen> createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 4.w),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoggedIn) {
              if (SharedPref.getUserRole().isEmpty) {
                context.pushReplacementNamed(AppRoutes.onBoardingScreen);
              } else {
                context.pushReplacementNamed(AppRoutes.home);
              }
            } else if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              print(state.message);
            }
          },
          builder: (context, state) {
            return OtpForm(
              email: widget.email,
              onCompleted: (value) => setState(() => otp = value),
              isLoading: state is LoginVerifyingOtp,
              onConfirm: () {
                context.read<LoginCubit>().verifyOtpThenLogin(
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
