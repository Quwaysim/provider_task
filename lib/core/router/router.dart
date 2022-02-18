import 'package:flutter/material.dart';
import 'package:provider_task/core/router/route_paths.dart';
import 'package:provider_task/ui/views/registration_page.dart';
import 'package:provider_task/ui/views/update_profile.dart';
import 'package:provider_task/ui/views/user_profile.dart';
import 'package:provider_task/ui/views/verification_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.registration:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case RoutePaths.verification:
        return MaterialPageRoute(builder: (_) => VerificationPage());
      case RoutePaths.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfilePage());
      case RoutePaths.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfilePage());
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
