import 'package:word_wise/core/core.dart';

class App extends StatelessWidget {
  const App({super.key, required this.router});
  final AppRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      theme: ThemeData(textTheme: AppTextTheme.textTheme),
      routerConfig: router.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
