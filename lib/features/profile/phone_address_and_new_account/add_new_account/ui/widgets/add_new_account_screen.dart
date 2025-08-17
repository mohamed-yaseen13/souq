import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_state.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/ui/widgets/add_account_button.dart';

class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  @override
  State<AddNewAccountScreen> createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24.h),
        child: BlocConsumer<AddAccountCubit, AddAccountState>(
          listener: (context, state) {
            if (state is AddAccountOtpSent) {
              context.pushNamed(
                AppRoutes.otpAddAccountScreen,
                arguments: {'email': state.email},
              );
            } else if (state is AddAccountError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Account',
                    style: AppTextStyles.orangeColor32FontText,
                  ),
                  verticalSpace(12),
                  EmailTextFormField(emailController: _emailController),
                  verticalSpace(64),
                  Center(
                    child: state is AddAccountSendingOtp
                        ? CircularProgressIndicator()
                        : AddAccountButton(
                            formKey: _formKey,
                            emailController: _emailController,
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
