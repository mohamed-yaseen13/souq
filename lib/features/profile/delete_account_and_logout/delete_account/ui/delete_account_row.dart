import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/features/profile/delete_account_and_logout/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:souq/features/profile/delete_account_and_logout/delete_account/logic/cubit/delete_account_state.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountError) {
          print('Error: ${state.message}');
          // show snackbar or dialog
        }
        if (state is DeleteAccountSuccess) {
          context.pushReplacementNamed(AppRoutes.signupScreen);
        }
      },
      child: BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
        builder: (context, state) {
          return InkWell(
            onTap: () async {
              await context.read<DeleteAccountCubit>().deleteAccount();
            },
            child: Row(
              children: [
                Text('Delete Account', style: AppTextStyles.redColor20FontText),
                Spacer(),
                state is DeleteAccountLoading
                    ? CircularProgressIndicator()
                    : Icon(
                        Icons.delete_forever,
                        size: 32.sp,
                        color: Colors.grey,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
