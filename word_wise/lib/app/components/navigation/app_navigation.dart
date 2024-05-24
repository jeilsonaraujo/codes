import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:word_wise/app/components/navigation/nav_bar.dart';
import 'package:word_wise/app/features/favorites_page/favorites_page.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/words_page/words_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key, required this.child, required this.path});
  final Widget child;
  final String path;

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: widget.child),
            WWNavBar(navigationItems: [
              WWNavItem(
                icon: Icons.menu_book_sharp,
                label: 'Words',
                selected: widget.path.startsWith('/${WordsPage.path}'),
                onTap: () => context.go('/${WordsPage.path}'),
              ),
              WWNavItem(
                icon: Icons.star_purple500_sharp,
                label: 'Favorites',
                selected: widget.path.startsWith('/${FavoritesPage.path}'),
                onTap: () => context.go('/${FavoritesPage.path}'),
              ),
              WWNavItem(
                icon: Icons.history,
                label: 'History',
                selected: widget.path.startsWith('/${HistoryPage.path}'),
                onTap: () => context.go('/${HistoryPage.path}'),
              )
            ])
          ],
        ),
      ),
    );
  }
}
