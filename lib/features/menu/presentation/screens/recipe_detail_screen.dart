import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/favorites_service.dart';
import '../widgets/recipe_card.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final Map<String, dynamic> recipe;
  final String userId;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userIdProvider.notifier).state = userId;
    final favoritesService = ref.watch(favoritesServiceProvider);
    final isFavoriteAsync = ref.watch(isFavoriteProvider(recipe['name']));

    final isFavorite = isFavoriteAsync.when(
      data: (value) => value,
      loading: () => false,
      error: (_, __) => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name'] as String),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              favoritesService.toggleFavorite(userId, recipe);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec les informations principales
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn(
                    context,
                    Icons.timer,
                    '${recipe['preparationTime']} min',
                    'Préparation',
                  ),
                  _buildInfoColumn(
                    context,
                    Icons.local_fire_department,
                    '${recipe['calories']} kcal',
                    'Calories',
                  ),
                ],
              ),
            ),

            // Restrictions alimentaires
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Régime alimentaire',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final diet in recipe['dietary'] as List<String>)
                        Chip(
                          label: Text(diet),
                          backgroundColor: Colors.green[100],
                          labelStyle: TextStyle(color: Colors.green[800]),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Ingrédients
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingrédients',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...(recipe['ingredients'] as List<String>).map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8),
                          const SizedBox(width: 8),
                          Text(ingredient),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Équipement nécessaire
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Équipement nécessaire',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...(recipe['equipment'] as List<String>).map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 16),
                          const SizedBox(width: 8),
                          Text(item),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
} 