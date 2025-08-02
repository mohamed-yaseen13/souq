import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/signup/logic/cubit/signup_state.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/core/widgets/password_text_form_field.dart';
import 'package:souq/features/signup/ui/widgets/role_drop_down.dart';
import 'package:souq/features/signup/ui/widgets/signup_button.dart';

class SignupForm extends StatefulWidget {
  final SignupState signupState;

  const SignupForm({super.key, required this.signupState});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedRole;

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
          PasswordTextFormField(passwordController: _passwordController),
          verticalSpace(24),
          RoleDropDown(
            onChanged: (value) => setState(() => _selectedRole = value),
            selectedRole: _selectedRole,
          ),
          verticalSpace(24),
          widget.signupState is SignupLoading
              ? const CircularProgressIndicator()
              : SignupButton(
                  formKey: _formKey,
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  selectedRole: _selectedRole,
                ),
        ],
      ),
    );
  }
}
