import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/features/auth/login_test/logic/login_test_cubit.dart';
import 'package:souq/features/auth/login_test/ui/widgets/login_test_button.dart';

class LoginTestForm extends StatefulWidget {
  final LoginTestState loginTestState;

  const LoginTestForm({super.key, required this.loginTestState});

  @override
  State<LoginTestForm> createState() => _LoginTestFormState();
}

class _LoginTestFormState extends State<LoginTestForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticalSpace(24),
          EmailTextFormField(emailController: _emailController),
          verticalSpace(24),
          widget.loginTestState.loading
              ? const CircularProgressIndicator()
              : LoginTestButton(
                  formKey: _formKey,
                  emailController: _emailController,
                ),
        ],
      ),
    );
  }
}
