import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/otp_form.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_state.dart';

class OtpAddAccountScreen extends StatefulWidget {
  final String email;

  const OtpAddAccountScreen({super.key, required this.email});

  @override
  State<OtpAddAccountScreen> createState() => _OtpSignupScreenState();
}

class _OtpSignupScreenState extends State<OtpAddAccountScreen> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 4.w),
        child: BlocConsumer<AddAccountCubit, AddAccountState>(
          listener: (context, state) {
            if (state is AddAccountAdded) {
              context.pushNamed(AppRoutes.onBoardingScreen);
            } else if (state is AddAccountError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return OtpForm(
              email: widget.email,
              onCompleted: (value) => setState(() => otp = value),
              isLoading: state is AddAccountVerifyingOtp,
              onConfirm: () {
                context.read<AddAccountCubit>().verifyOtpThenAddAccount(
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
