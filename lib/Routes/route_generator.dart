import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_project/ui_design/dashboard.dart';

import '../main.dart';
import '../ui_design/OnboardingScreen.dart';
import '../ui_design/OnboardingScreen.dart';
import '../ui_design/notification_screen.dart';
import '../ui_design/products_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.dashboard:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    case RoutePaths.OnboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
        case RoutePaths.ProductsPage:
        return MaterialPageRoute(builder: (_) => ProductsPage());
      //
      // case RoutePaths.NotificationScreen:
      //
      //   return MaterialPageRoute(
      //     builder: (context) => NotificationScreen(
      //       payload: arguments?['payload'],
      //       notificationCount: arguments?['notificationCount'] ?? 0,
      //     ),
      //   );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RoutePaths {
  static const String splashScreen = '/';
  static const String dashboard = '/dashboard';
  static const String NotificationScreen = '/NotificationScreen';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String changepassword = '/changepassword';
  static const String setting = '/setting';
  static const String OnboardingScreen = '/OnboardingScreen';
  static const String ProductsPage = '/ProductsPage';
}
