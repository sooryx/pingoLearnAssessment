import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pingolearn/Screens/Auth/signinscreen.dart';
import 'package:pingolearn/Screens/Auth/signupscreen.dart';
import 'package:pingolearn/Screens/Homepage/homescreen.dart';
import 'package:pingolearn/Screens/Splashscreen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashScreen(),
  '/signin': (context) =>  SigninScreen(),
  '/signup': (context) =>  Signupscreen(),
  '/homescreen': (context) => const Homescreen(),
};

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/signin':
        return PageTransition(
          child: SigninScreen(),
          type: PageTransitionType.topToBottom,
          settings: settings,
        );
      case '/signup':
        return PageTransition(
          child: Signupscreen(),duration: Duration(milliseconds:200),
          type: PageTransitionType.bottomToTop,
          settings: settings,
        );
      case '/homescreen':
        return PageTransition(
          child: const Homescreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
