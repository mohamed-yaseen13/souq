import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/core/widgets/password_text_form_field.dart';

class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  @override
  State<AddNewAccountScreen> createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Account', style: AppTextStyles.orangeColor32FontText),
            verticalSpace(12),
            NameTextFormField(nameController: _nameController),
            verticalSpace(24),
            EmailTextFormField(emailController: _emailController),
            verticalSpace(24),
            PasswordTextFormField(passwordController: _passwordController),
            verticalSpace(64),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add Account'),
              ),
            ),
            verticalSpace(24),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xFFEDF1F3), thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text('Or'),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFFEDF1F3), thickness: 1),
                    ),
                  ],
                ),
                verticalSpace(24),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Continue with Google'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
