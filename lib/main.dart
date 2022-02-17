import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/router/route_paths.dart';
import 'package:provider_task/core/router/router.dart';

import 'package:provider_task/core/models/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RegistrationModel(),
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
      initialRoute: RoutePaths.registration,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
