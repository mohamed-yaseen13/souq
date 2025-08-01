import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/signup/data/signup_request_model.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/signup/logic/cubit/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedRole;

  final List<String> roles = ['customer', 'delivery man', 'seller'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              context.pushReplacementNamed(AppRoutes.home);
            } else if (state is SignupError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your name' : null,
                    ),
                    verticalSpace(12),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your email' : null,
                    ),
                    verticalSpace(12),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Password' : null,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: const InputDecoration(
                        labelText: 'Select Role',
                      ),
                      items: roles.map((role) {
                        return DropdownMenuItem(value: role, child: Text(role));
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _selectedRole = value),
                      validator: (value) =>
                          value == null ? 'Select a role' : null,
                    ),
                    verticalSpace(24),
                    state is SignupLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final request = SignupRequestModel(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  role: _selectedRole!,
                                );
                                context.read<SignupCubit>().signupWithEmail(
                                  request,
                                );
                              }
                            },
                            child: const Text('Sign Up'),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
