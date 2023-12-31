import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/error/no_internet_connection.dart';
import 'package:up_dev_chef_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:up_dev_chef_app/features/profile/presentation/screens/home_screen.dart';
import 'package:up_dev_chef_app/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:up_dev_chef_app/features/splash/presentation/screens/splash_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';

class Routes {
  static const String intitlRoute = '/';

  static const String login = '/login';

  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String updateProfileScreen = '/updateProfileScreen';

  static const String signUpProfile = '/signUpProfile';

  static const String signUpPersonalImage = '/signUpPersonalImage';

  static const String signUpLocation = '/signUpLocation';

  static const String signUpMoreInfo = '/signUpMoreInfo';
  static const String noInternetConnection = '/noInternetConnection';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());

      case Routes.noInternetConnection:
        return MaterialPageRoute(
            builder: (_) => const NoInternetConnectionScreen());

      // case Routes.signUpPersonalImage:
      //     return MaterialPageRoute(builder: (_) => const signUpPersonalImageScreen());

      // case Routes.signUpLocation:
      //     return MaterialPageRoute(builder: (_) => const signUpLocationScreen());

      // case Routes.signUpMoreInfo:
      //     return MaterialPageRoute(builder: (_) => const signUpMoreInfoScreen());
      default:
        return null;
    }
  }
}
