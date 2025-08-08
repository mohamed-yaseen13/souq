import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
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
                  child: Column(
                    children: [
                      Text(
                        'Select a Role',
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
                      ElevatedButton(
                        onPressed: selectedRole == null
                            ? null
                            : () async {
                                final id = await SharedPref.getUserId();
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(id)
                                    .update({'role': selectedRole?.name});
                                if (!mounted) return;
                                // ignore: use_build_context_synchronously
                                context.pushReplacementNamed(AppRoutes.home);
                              },
                        child: Text('Get Started'),
                      ),
                    ],
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
