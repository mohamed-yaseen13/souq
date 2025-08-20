import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/features/profile/delete_account_and_logout/logout/logic/cubit/logout_cubit.dart';
import 'package:souq/features/profile/delete_account_and_logout/logout/logic/cubit/logout_state.dart';

class LogoutRow extends StatelessWidget {
  const LogoutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await context.read<LogoutCubit>().logout();
            if (context.mounted) {
              context.pushReplacementNamed(AppRoutes.signupScreen);
            }
          },
          child: Row(
            children: [
              Text('Logout', style: AppTextStyles.redColor20FontText),
              Spacer(),
              state is LogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.logout, size: 32.sp, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}
