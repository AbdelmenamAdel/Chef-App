import 'package:chef/feature/auth/presentation/screens/login_screen.dart';
import 'package:chef/feature/auth/presentation/screens/change_lang_screen.dart';
import 'package:chef/feature/auth/presentation/screens/reset_password.dart';
import 'package:chef/feature/auth/presentation/screens/send_code_screen.dart';
import 'package:chef/feature/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef/feature/menu/presentation/screens/menu_screen.dart';
import 'package:chef/feature/profile/presentation/screens/change_password_screen.dart';
import 'package:chef/feature/profile/presentation/screens/profile_home_screen.dart';
import 'package:chef/feature/profile/presentation/screens/settings_screen.dart';
import 'package:chef/feature/profile/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String chageLang = '/chageLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String addMeal = '/addMeal';
  static const String menuHome = '/menuHome';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String settings = '/settings';
  static const String changePassword = '/changePassword';
}

class AppRoutes {
  static Route? generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.chageLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => const ProfileHomeScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      case Routes.menuHome:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Found Route'),
            ),
          ),
        );
    }
  }
}
