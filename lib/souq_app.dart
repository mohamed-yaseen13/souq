import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/routing/app_router.dart';
import 'package:souq/core/routing/app_routes.dart';

class SouqApp extends StatelessWidget {
  final bool isUserLoggedIn;

  const SouqApp({super.key, required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isUserLoggedIn
              ? AppRoutes.home
              : AppRoutes.signupScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
