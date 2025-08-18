import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/test/test.dart';

class TestEmail extends StatefulWidget {
  const TestEmail({super.key});

  @override
  State<TestEmail> createState() => _TestEmailState();
}

class _TestEmailState extends State<TestEmail> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Column(
        children: [
          EmailTextFormField(emailController: _emailController),
          verticalSpace(24),
          ElevatedButton(
            onPressed: () async {
              final email = await Test.checkEmailProvider(
                _emailController.text,
              );
              print(email);
            },
            child: Text('Check'),
          ),
        ],
      ),
    );
  }
}
