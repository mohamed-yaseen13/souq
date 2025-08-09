import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/login/data/login_request_model.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final request = LoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          );
          context.read<LoginCubit>().loginWithEmail(request);
        }
      },
      child: const Text('Login'),
    );
  }
}
