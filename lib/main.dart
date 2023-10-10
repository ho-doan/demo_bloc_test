import 'package:bloc_ffff/core/services/data_source/networks/i_api_client.dart';
import 'package:bloc_ffff/core/services/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';

import 'feature/home/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(dio: ApiUtil.initDio());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: homeRouter,
    );
  }
}
