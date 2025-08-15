import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/signup_test/data/signup_test_request_model.dart';
import 'package:souq/features/auth/signup_test/logic/signup_test_cubit.dart';

class SignupTestButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;

  const SignupTestButton({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final request = SignupTestRequestModel(
            name: nameController.text,
            email: emailController.text,
          );
          context.read<SignupTestCubit>().sendOtp(request.email);
        }
      },
      child: const Text('Sign Up'),
    );
  }
}
