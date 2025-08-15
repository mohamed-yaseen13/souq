import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/auth/signup_test/logic/signup_test_cubit.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String otp;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 4.w),
        child: BlocConsumer<SignupTestCubit, SignupTestState>(
          listener: (context, state) {
            if (state.signedIn) {
              context.pushNamed(AppRoutes.home);
            } else if (!state.error.isNullOrEmpty()) {
              print(state.error.toString());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'OTP Verification Code',
                  style: AppTextStyles.orangeColor32FontText,
                ),
                verticalSpace(64),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  showCursor: true,
                  separatorBuilder: (index) => const SizedBox(width: 12),
                  onCompleted: (value) {
                    setState(() {
                      otp = value;
                    });
                    print(otp);
                  },
                ),
                verticalSpace(64),
                state.loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          context.read<SignupTestCubit>().verifyOtp(
                            otp,
                            widget.email,
                          );
                        },
                        child: Text('confirm'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
