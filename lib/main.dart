import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/auth_provider.dart';
import 'package:provider_task/core/providers/user_provider.dart';
import 'package:provider_task/core/router/route_paths.dart';
import 'package:provider_task/core/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _sharedPref = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(_sharedPref)),
        ChangeNotifierProvider(create: (_) => UserProvider(_sharedPref)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.userProfile,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
