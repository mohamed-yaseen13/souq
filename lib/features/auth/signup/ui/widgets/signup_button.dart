import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;

  const SignupButton({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      desc: 'Create an Account',
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          context.read<SignupCubit>().sendOtp(emailController.text);
          await SharedPref.setUserName(nameController.text);
        }
      },
    );
  }
}
