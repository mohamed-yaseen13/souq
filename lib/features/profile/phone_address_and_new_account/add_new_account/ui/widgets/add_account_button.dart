import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_cubit.dart';

class AddAccountButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;

  const AddAccountButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          context.read<AddAccountCubit>().sendOtp(emailController.text);
          await SharedPref.setUserName(nameController.text);
        }
      },
      desc: 'Add Account',
    );
  }
}
