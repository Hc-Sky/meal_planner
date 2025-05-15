import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/menu_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class MenuScreen extends ConsumerWidget {
  final String userId;

  const MenuScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _generateMenu(context, ref),
          ),
        ],
      ),
      body: menuState.when(
        data: (menu) {
          if (menu == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Aucun menu généré'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _generateMenu(context, ref),
                    child: const Text('Générer un menu'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: menu['days'].length,
            itemBuilder: (context, index) {
              final day = menu['days'][index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Jour ${index + 1}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  RecipeCard(
                    recipe: day['meals']['breakfast'],
                    userId: userId,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            recipe: day['meals']['breakfast'],
                            userId: userId,
                          ),
                        ),
                      );
                    },
                  ),
                  RecipeCard(
                    recipe: day['meals']['lunch'],
                    userId: userId,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            recipe: day['meals']['lunch'],
                            userId: userId,
                          ),
                        ),
                      );
                    },
                  ),
                  RecipeCard(
                    recipe: day['meals']['dinner'],
                    userId: userId,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            recipe: day['meals']['dinner'],
                            userId: userId,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Génération du menu en cours...'),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _generateMenu(context, ref),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generateMenu(BuildContext context, WidgetRef ref) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez d\'abord configurer votre profil'),
          ),
        );
        return;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      await ref.read(menuControllerProvider.notifier).generateMenu({
        'userId': userId,
        'dietaryRestrictions': userData['dietaryRestrictions'] ?? [],
        'equipment': userData['equipment'] ?? [],
        'allergies': userData['allergies'] ?? [],
        'maxPreparationTime': userData['maxPreparationTime'] ?? 30,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
} 