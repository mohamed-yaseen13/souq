import 'package:flutter/material.dart';

class AddAccountButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const AddAccountButton({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          //final request = SignupRequestModel(
          //  name: nameController.text,
          //  email: emailController.text,
          //  password: passwordController.text,
          //);
          //context.read<SignupCubit>().signupWithEmail(request);
        }
      },
      child: const Text('Add Account'),
    );
  }
}
