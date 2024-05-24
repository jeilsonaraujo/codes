import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:word_wise/app/components/navigation/app_navigation.dart';
import 'package:word_wise/app/features/favorites_page/favorites_page.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_page.dart';
import 'package:word_wise/app/features/words_page/words_page.dart';

class AppRouter {
  final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${WordsPage.path}',
    routes: <RouteBase>[
      ShellRoute(
          pageBuilder: (context, state, child) => _buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: AppNavigation(
                path: state.fullPath ?? '',
                child: child,
              )),
          routes: [
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) => Container(),
              pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                state: state,
                context: context,
                child: Container(color: Colors.blueGrey),
              ),
              routes: [
                GoRoute(
                    path: WordsPage.path,
                    pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                          state: state,
                          context: context,
                          child: const WordsPage(),
                        ),
                    routes: [
                      GoRoute(
                        path: '${WordDefinitionPage.path}/:word',
                        pageBuilder: (context, state) {
                          final word = state.pathParameters['word']!;
                          return _buildPageWithDefaultTransition<void>(
                            context: context,
                            state: state,
                            child: WordDefinitionPage(word: word),
                          );
                        },
                      ),
                    ]),
                GoRoute(
                  path: 'favorites',
                  pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                    state: state,
                    context: context,
                    child: const FavoritesPage(),
                  ),
                ),
                GoRoute(
                  path: 'history',
                  pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: const HistoryPage(),
                  ),
                ),
              ],
            )
          ]),

      // GoRoute(
      //   path: '/login',
      //   pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
      //     context: context,
      //     state: state,
      //     child: const LoginScreen(),
      //   ),
      // ),
    ],
  );
}

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}
