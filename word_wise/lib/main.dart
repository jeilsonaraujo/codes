import 'package:flutter/material.dart';
import 'package:word_wise/core/inject.dart';
import 'package:word_wise/core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
