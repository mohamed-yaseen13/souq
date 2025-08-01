import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/di/di.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/home/home_screen.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/signup/ui/signup_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
