import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/features/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/on_boarding/logic/cubit/role_selection_state.dart';
import 'package:souq/features/on_boarding/ui/widgets/role_card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Role? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                child: Center(
                  child: BlocConsumer<RoleSelectionCubit, RoleSelectionState>(
                    listener: (context, state) {
                      if (state is RoleSelectionSuccess) {
                        context.pushReplacementNamed(AppRoutes.home);
                      } else if (state is RoleSelectionError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Some thing went wrong')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text(
                            'Select a Role to complete your account',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpace(8),
                          ...Role.values.map(
                            (role) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: RoleCard(
                                role: role,
                                isSelected: selectedRole == role,
                                onTap: () {
                                  setState(() => selectedRole = role);
                                },
                              ),
                            ),
                          ),
                          verticalSpace(8),
                          state is RoleSelectionLoading
                              ? CircularProgressIndicator()
                              : AppButton(
                                  onPressed: selectedRole == null
                                      ? () {}
                                      : () {
                                          context
                                              .read<RoleSelectionCubit>()
                                              .setRole(selectedRole!.name);
                                        },
                                  desc: 'Get Started',
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
