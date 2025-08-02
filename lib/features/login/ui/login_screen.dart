import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/login/logic/cubit/login_state.dart';
import 'package:souq/features/login/ui/widgets/dont_have_an_account_row.dart';
import 'package:souq/features/login/ui/widgets/login_form.dart';

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
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      context.pushReplacementNamed(AppRoutes.home);
                    } else if (state is LoginError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return LoginForm(loginState: state);
                  },
                ),
                verticalSpace(24),
                DontHaveAnAccountRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
