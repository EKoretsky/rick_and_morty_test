import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_effective/src/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:test_effective/src/presentation/screens/characters_screen/characters_screen.dart';
import 'package:test_effective/src/presentation/screens/settings_screen/settings_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _charactersNavigatorKey = GlobalKey<NavigatorState>();
final _favoritesNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, _, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.list), label: 'Characters'),
              NavigationDestination(icon: Icon(Icons.star), label: 'Favorites'),
              NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
            ],
            onDestinationSelected: (index) {
              navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
            },
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _charactersNavigatorKey,
          routes: [GoRoute(path: '/', pageBuilder: (_, _) => MaterialPage(child: CharacterScreen()))],
        ),
        StatefulShellBranch(
          navigatorKey: _favoritesNavigatorKey,
          routes: [GoRoute(path: '/favorites', pageBuilder: (_, _) => MaterialPage(child: FavoritesScreen()))],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [GoRoute(path: '/settings', pageBuilder: (_, _) => MaterialPage(child: SettingsScreen()))],
        ),
      ],
    ),
  ],
);
