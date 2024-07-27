import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pingolearn/Screens/Auth/signinscreen.dart';
import 'package:pingolearn/Screens/Auth/signupscreen.dart';
import 'package:pingolearn/Screens/Homepage/homescreen.dart';
import 'package:pingolearn/Screens/Splashscreen/splashscreen.dart';
import 'package:pingolearn/Services/RemoteConfigServices/remoteconfigservices.dart';
import 'package:pingolearn/Widgets/doublebacktoclosetheapp.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          child: const DoubleTapBackToClose(child: SplashScreen()),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/signin':
        return PageTransition(
          child:  DoubleTapBackToClose(child: SigninScreen()),
          type: PageTransitionType.topToBottom,
          settings: settings,
        );
      case '/signup':
        return PageTransition(
          child:  DoubleTapBackToClose(child: Signupscreen()),
          duration: const Duration(milliseconds: 200),
          type: PageTransitionType.bottomToTop,
          settings: settings,
        );
      case '/homescreen':
        return PageTransition(
          child: DoubleTapBackToClose(
            child: Homescreen(
              remoteConfigService: settings.arguments as RemoteConfigService,
            ),
          ),
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
