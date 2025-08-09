import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/di/di.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/home/home_screen.dart';
import 'package:souq/features/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/login/ui/login_screen.dart';
import 'package:souq/features/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:souq/features/reset_password/logic/cubit/reset_password_cubit.dart';
import 'package:souq/features/reset_password/ui/reset_password_screen.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/signup/ui/signup_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RoleSelectionCubit>(),
            child: OnBoardingScreen(),
          ),
          settings: settings,
        );

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

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPasswordScreen(),
          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
