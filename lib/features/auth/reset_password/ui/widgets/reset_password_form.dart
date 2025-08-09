import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/features/auth/reset_password/logic/cubit/reset_password_state.dart';
import 'package:souq/features/auth/reset_password/ui/widgets/reset_password_button.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';

class ResetPasswordForm extends StatefulWidget {
  final ResetPasswordState resetPasswordState;

  const ResetPasswordForm({super.key, required this.resetPasswordState});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
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
          widget.resetPasswordState is ResetPasswordLoading
              ? const CircularProgressIndicator()
              : ResetPasswordButton(
                  formKey: _formKey,
                  emailController: _emailController,
                ),
        ],
      ),
    );
  }
}
