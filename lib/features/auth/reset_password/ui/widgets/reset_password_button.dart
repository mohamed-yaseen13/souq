import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/reset_password/data/reset_password_request_model.dart';
import 'package:souq/features/auth/reset_password/logic/cubit/reset_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const ResetPasswordButton({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final request = ResetPasswordRequestModel(
            email: emailController.text,
          );

          context.read<ResetPasswordCubit>().sendResetPasswordEmail(request);
        }
      },
      child: const Text('Reset Password'),
    );
  }
}
