import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/auth/login/logic/cubit/login_state.dart';
import 'package:souq/features/auth/login/ui/widgets/dont_have_an_account_row.dart';
import 'package:souq/features/auth/login/ui/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login', style: AppTextStyles.blackColor32FontText),
                    verticalSpace(4),
                    Text(
                      'Create an account to continue!',
                      style: AppTextStyles.greyColor12Font500WeightText,
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginOtpSent) {
                          context.pushNamed(
                            AppRoutes.otpLoginScreen,
                            arguments: {'email': state.email},
                          );
                        } else if (state is LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        return LoginForm(loginState: state);
                      },
                    ),
                    verticalSpace(32),
                    DontHaveAnAccountRow(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
