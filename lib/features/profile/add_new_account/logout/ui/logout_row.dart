import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_dialog.dart';
import 'package:souq/features/profile/add_new_account/logout/logic/cubit/logout_cubit.dart';
import 'package:souq/features/profile/add_new_account/logout/logic/cubit/logout_state.dart';

class LogoutRow extends StatelessWidget {
  const LogoutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) async {
        if (state is LogoutSuccess) {
          if (context.mounted) {
            context.pushReplacementNamed(AppRoutes.signupScreen);
          }
        }
        if (state is LogoutError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final shouldLogout = await showDialog<bool>(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AppDialog(
                  desc: 'Log Out',
                  title: "Are you sure you want to\nlogout?",
                );
              },
            );
            if (shouldLogout == true && context.mounted) {
              await context.read<LogoutCubit>().logout();
            }
          },
          child: Row(
            children: [
              Text('Logout', style: AppTextStyles.redColor20FontText),
              const Spacer(),
              state is LogoutLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(Icons.logout, size: 25.sp, color: Colors.red),
            ],
          ),
        );
      },
    );
  }
}
