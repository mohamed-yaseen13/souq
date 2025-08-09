import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/signup/data/signup_request_model.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignupButton({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final request = SignupRequestModel(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          );
          context.read<SignupCubit>().signupWithEmail(request);
        }
      },
      child: const Text('Sign Up'),
    );
  }
}
