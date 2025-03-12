import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_effective/src/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:test_effective/src/presentation/screens/home_screen/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _charactersNavigatorKey = GlobalKey<NavigatorState>();
final _favoritesNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Characters',
              ),
              NavigationDestination(icon: Icon(Icons.star), label: 'Favorites'),
            ],
            onDestinationSelected: (index) => _goBranch(index, navigationShell),
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _charactersNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (_, _) => MaterialPage(child: HomeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoritesNavigatorKey,
          routes: [
            GoRoute(
              path: '/favorites',
              pageBuilder: (_, _) => MaterialPage(child: FavoritesScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
);

void _goBranch(int index, StatefulNavigationShell navigationShell) {
  navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );
}
