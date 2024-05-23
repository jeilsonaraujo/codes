import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:word_wise/components/navigation/nav_bar.dart';

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
                selected: widget.path == '/words',
                onTap: () => context.go('/words'),
              ),
              WWNavItem(
                icon: Icons.star_purple500_sharp,
                label: 'Favorites',
                selected: widget.path == '/favorites',
                onTap: () => context.go('/favorites'),
              ),
              WWNavItem(
                icon: Icons.history,
                label: 'History',
                selected: widget.path == '/history',
                onTap: () => context.go('/history'),
              )
            ])
          ],
        ),
      ),
    );
  }
}
