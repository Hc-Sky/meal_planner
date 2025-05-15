import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/screens/auth_screen.dart';
import '../features/profile/presentation/screens/profile_form_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/menu/presentation/screens/menu_screen.dart';
import '../features/pantry/presentation/screens/pantry_screen.dart';
import '../features/shopping/presentation/screens/shopping_list_screen.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../debug/seed_database.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isAuthRoute = state.matchedLocation == '/auth';

      if (!isLoggedIn && !isAuthRoute) {
        return '/auth';
      }

      if (isLoggedIn && isAuthRoute) {
        return '/';
      }

      return null;
    },
    routes: [
      // Route d'authentification
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      // Route de configuration du profil
      GoRoute(
        path: '/setup-profile',
        name: 'setup-profile',
        builder: (context, state) => const ProfileFormScreen(),
      ),
      // Route de la page de profil
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileFormScreen(),
      ),
      // Shell route pour le layout principal
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          // Route de la page d'accueil
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          // Route du menu
          GoRoute(
            path: '/menu',
            name: 'menu',
            builder: (context, state) {
              final userId = authState.value?.uid;
              if (userId == null) {
                return const AuthScreen();
              }
              return MenuScreen(userId: userId);
            },
          ),
          // Route du garde-manger
          GoRoute(
            path: '/pantry',
            name: 'pantry',
            builder: (context, state) => const PantryScreen(),
          ),
          // Route de la liste de courses
          GoRoute(
            path: '/shopping-list',
            name: 'shopping-list',
            builder: (context, state) => const ShoppingListScreen(),
          ),
          // Route de debug pour le seed de la base de données
          GoRoute(
            path: '/debug/seed',
            name: 'debug-seed',
            builder: (context, state) => const SeedDatabaseScreen(),
          ),
        ],
      ),
    ],
  );
});

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed('home');
              break;
            case 1:
              context.goNamed('menu');
              break;
            case 2:
              context.goNamed('pantry');
              break;
            case 3:
              context.goNamed('shopping-list');
              break;
          }
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.kitchen_outlined),
            selectedIcon: Icon(Icons.kitchen),
            label: 'Garde-manger',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Courses',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/menu')) return 1;
    if (location.startsWith('/pantry')) return 2;
    if (location.startsWith('/shopping-list')) return 3;
    return 0;
  }
} 