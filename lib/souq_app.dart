import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/routing/app_router.dart';
import 'package:souq/core/routing/app_routes.dart';

class SouqApp extends StatelessWidget {
  const SouqApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final bool isLoggedIn = SharedPref.getIsUserLoggedIn();
    //final String role = SharedPref.getUserRole();
    //
    //late final String startRoute;
    //if (isLoggedIn && role.isNotEmpty) {
    //  startRoute = AppRoutes.home;
    //} else if (isLoggedIn && role.isEmpty) {
    //  startRoute = AppRoutes.onBoardingScreen;
    //} else {
    //  startRoute = AppRoutes.signupScreen;
    //}

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.signupScreen,
          //initialRoute: AppRoutes.loginTestScreen,
          //initialRoute: AppRoutes.signupTestScreen,
          //initialRoute: startRoute,
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF5F5F5),
            appBarTheme: AppBarTheme(color: const Color(0xFFF5F5F5)),
          ),
        );
      },
    );
  }
}
