import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/favorites_service.dart';

final isFavoriteProvider = StreamProvider.autoDispose.family<bool, String>(
  (ref, recipeName) {
    final favoritesService = ref.watch(favoritesServiceProvider);
    return favoritesService.isFavorite(ref.read(userIdProvider), recipeName).asStream();
  },
);

final userIdProvider = StateProvider<String>((ref) => '');

class RecipeCard extends ConsumerWidget {
  final Map<String, dynamic> recipe;
  final String userId;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.userId,
    required this.onTap,
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

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      recipe['name'] as String,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
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
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${recipe['preparationTime']} min',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.local_fire_department,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${recipe['calories']} kcal',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
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
      ),
    );
  }
} 