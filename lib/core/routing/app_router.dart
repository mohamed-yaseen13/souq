import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/di/di.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/auth/signup/ui/widgets/otp_signup_screen.dart';
import 'package:souq/features/chat/chats_screen.dart';
import 'package:souq/features/home/ui/home_screen.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/auth/login/ui/login_screen.dart';
import 'package:souq/features/auth/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/auth/on_boarding/ui/on_boarding_screen.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/auth/signup/ui/signup_screen.dart';
import 'package:souq/features/orders/orders_screen.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/ui/widgets/otp_add_account_screen.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/logic/cubit/phone_cubit.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_cubit.dart';
import 'package:souq/features/profile/ui/profile_screen.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/ui/widgets/add_new_account_screen.dart';
import 'package:souq/features/profile/phone_address_and_new_account/address/ui/widgets/edit_address_screen.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/ui/widgets/edit_phone_numder_screen.dart';
import 'package:souq/features/profile/picture_and_name/ui/widgets/edit_picture_and_name_screen.dart';
import 'package:souq/features/profile/picture_and_name/ui/widgets/view_image_screen.dart';
import 'package:souq/features/settings/settings_screen.dart';

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

      case AppRoutes.otpSignupScreen:
        final args = settings.arguments as Map<String, String?>;
        final email = args['email'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: OtpSignupScreen(email: email!),
          ),
          settings: settings,
        );

      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RoleSelectionCubit>(),
            child: OnBoardingScreen(),
          ),
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

      case AppRoutes.home:
        return _animatedRoute(page: HomeScreen(), settings: settings);

      case AppRoutes.chatsScreen:
        return _animatedRoute(page: ChatsScreen(), settings: settings);

      case AppRoutes.ordersScreen:
        return _animatedRoute(page: OrdersScreen(), settings: settings);

      case AppRoutes.profileScreen:
        return _animatedRoute(
          page: BlocProvider(
            create: (context) => getIt<PictureAndNameCubit>(),
            child: ProfileScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.settingsScreen:
        return _animatedRoute(page: SettingsScreen(), settings: settings);

      case AppRoutes.editPictureAndNameScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PictureAndNameCubit>(),
            child: EditPictureAndNameScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.editPhoneNumberScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PhoneCubit>(),
            child: EditPhoneNumderScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.editAddressScreen:
        return MaterialPageRoute(
          builder: (_) => EditAddressScreen(),
          settings: settings,
        );

      case AppRoutes.addNewAccountScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddAccountCubit>(),
            child: AddNewAccountScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.otpAddAccountScreen:
        final args = settings.arguments as Map<String, String?>;
        final email = args['email'];

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddAccountCubit>(),
            child: OtpAddAccountScreen(email: email!),
          ),
          settings: settings,
        );

      case AppRoutes.viewImageScreen:
        return MaterialPageRoute(
          builder: (_) => ViewImageScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }

  static PageRouteBuilder _animatedRoute({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
