import 'package:flutter/material.dart';
import 'package:provider_task/core/router/route_paths.dart';
import 'package:provider_task/ui/registration/registration_page.dart';
import 'package:provider_task/ui/verification/verification_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.registration:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case RoutePaths.verification:
        return MaterialPageRoute(builder: (_) => VerificationPage());
      // case RoutePaths.userProfile:
      //   return MaterialPageRoute(builder: (_) => ());
      // case RoutePaths.updateProfile:
      //   return MaterialPageRoute(builder: (_) => ());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
