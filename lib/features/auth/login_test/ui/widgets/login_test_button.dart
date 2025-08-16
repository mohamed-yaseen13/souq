import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/login_test/logic/login_test_cubit.dart';

class LoginTestButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const LoginTestButton({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<LoginTestCubit>().sendOtp(emailController.text);
        }
      },
      child: const Text('Login'),
    );
  }
}
