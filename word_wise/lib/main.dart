import 'package:flutter/material.dart';
import 'package:word_wise/app/theme/app_text_theme.dart';
import 'package:word_wise/core/inject.dart';
import 'package:word_wise/core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  runApp(MyApp(router: inject<AppRouter>()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final AppRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(textTheme: AppTextTheme.textTheme),
      routerConfig: router.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
