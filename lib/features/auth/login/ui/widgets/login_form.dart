import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/auth/login/logic/cubit/login_state.dart';
import 'package:souq/features/auth/login/ui/widgets/login_button.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/core/widgets/password_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final LoginState loginState;

  const LoginForm({super.key, required this.loginState});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticalSpace(24),
          EmailTextFormField(emailController: _emailController),
          verticalSpace(24),
          PasswordTextFormField(passwordController: _passwordController),
          verticalSpace(24),
          widget.loginState is LoginLoading
              ? const CircularProgressIndicator()
              : LoginButton(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
        ],
      ),
    );
  }
}
