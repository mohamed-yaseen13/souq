import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/auth/login_test/logic/login_test_cubit.dart';
import 'package:souq/features/auth/login_test/ui/widgets/login_test_form.dart';

class LoginTestScreen extends StatelessWidget {
  const LoginTestScreen({super.key});

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
                  'Login',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocConsumer<LoginTestCubit, LoginTestState>(
                  listener: (context, state) {
                    if (state.otpSent) {
                      context.pushNamed(
                        AppRoutes.otpLoginScreen,
                        arguments: {'email': state.email},
                      );
                    } else if (!state.error.isNullOrEmpty()) {
                      print(state.error.toString());
                    }
                  },
                  builder: (context, state) {
                    return LoginTestForm(loginTestState: state);
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
