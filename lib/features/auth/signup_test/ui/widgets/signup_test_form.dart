import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/features/auth/signup_test/logic/signup_test_cubit.dart';
import 'package:souq/features/auth/signup_test/ui/widgets/signup_test_button.dart';

class SignupTestForm extends StatefulWidget {
  final SignupTestState signupTestState;

  const SignupTestForm({super.key, required this.signupTestState});

  @override
  State<SignupTestForm> createState() => _SignupTestFormState();
}

class _SignupTestFormState extends State<SignupTestForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticalSpace(24),
          NameTextFormField(nameController: _nameController),
          verticalSpace(24),
          EmailTextFormField(emailController: _emailController),
          verticalSpace(24),
          widget.signupTestState.loading
              ? const CircularProgressIndicator()
              : SignupTestButton(
                  formKey: _formKey,
                  nameController: _nameController,
                  emailController: _emailController,
                ),
        ],
      ),
    );
  }
}
