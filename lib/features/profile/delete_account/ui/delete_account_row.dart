import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_dialog.dart';
import 'package:souq/features/profile/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:souq/features/profile/delete_account/logic/cubit/delete_account_state.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is DeleteAccountSuccess) {
          context.pushReplacementNamed(AppRoutes.signupScreen);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final shouldDelete = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AppDialog(
                  desc: 'Delete',
                  title: "Are you sure you want to\nDelete this account?",
                );
              },
            );
            if (shouldDelete == true && context.mounted) {
              await context.read<DeleteAccountCubit>().deleteAccount();
            }
          },
          child: Row(
            children: [
              Text('Delete Account', style: AppTextStyles.redColor20FontText),
              Spacer(),
              state is DeleteAccountLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.delete_forever, size: 30.sp, color: Colors.red),
            ],
          ),
        );
      },
    );
  }
}
