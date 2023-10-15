import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String intitlRoute = '/';

  static const String login = '/login';

  static const String signUp = '/signUp';

  static const String signUpProfile = '/signUpProfile';

  static const String signUpPersonalImage = '/signUpPersonalImage';

  static const String signUpLocation = '/signUpLocation';

  static const String signUpMoreInfo = '/signUpMoreInfo';
}
  class AppRoutes {
    static Route? generateRoute(RouteSettings routeSettings) {
      switch (routeSettings.name) {
      //case Routes.intitlRoute:
      // return MaterialPageRoute(builder: (_) => const SplashScreen());

      //case Routes.login:
      //     return MaterialPageRoute(builder: (_) => const LoginScreen());

      // case Routes.signUp:
      //     return MaterialPageRoute(builder: (_) => const signUpScreen());

      // case Routes.signUpProfile:
      //     return MaterialPageRoute(builder: (_) => const signUpProfileScreen());

      // case Routes.signUpPersonalImage:
      //     return MaterialPageRoute(builder: (_) => const signUpPersonalImageScreen());

      // case Routes.signUpLocation:
      //     return MaterialPageRoute(builder: (_) => const signUpLocationScreen());

      // case Routes.signUpMoreInfo:
      //     return MaterialPageRoute(builder: (_) => const signUpMoreInfoScreen());
      }
    }
  }