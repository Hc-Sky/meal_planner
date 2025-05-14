import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Aujourd\'hui'),
            backgroundColor: theme.colorScheme.inversePrimary,
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () => context.pushNamed('profile'),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Section des repas du jour
                _buildSection(
                  context,
                  title: 'Repas du jour',
                  child: Column(
                    children: [
                      _buildMealCard(
                        context,
                        title: 'Petit-déjeuner',
                        time: '8:00',
                        meal: 'Porridge aux fruits',
                        calories: '350 kcal',
                      ),
                      const SizedBox(height: 8),
                      _buildMealCard(
                        context,
                        title: 'Déjeuner',
                        time: '12:30',
                        meal: 'Salade de quinoa',
                        calories: '450 kcal',
                      ),
                      const SizedBox(height: 8),
                      _buildMealCard(
                        context,
                        title: 'Dîner',
                        time: '19:00',
                        meal: 'Poulet aux légumes',
                        calories: '550 kcal',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Section liste de courses
                _buildSection(
                  context,
                  title: 'Liste de courses',
                  action: TextButton(
                    onPressed: () => context.pushNamed('shopping-list'),
                    child: const Text('Voir tout'),
                  ),
                  child: Column(
                    children: [
                      _buildShoppingItem(context, 'Poulet', '500g'),
                      _buildShoppingItem(context, 'Quinoa', '250g'),
                      _buildShoppingItem(context, 'Légumes', '1kg'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Section actions rapides
                _buildSection(
                  context,
                  title: 'Actions rapides',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuickActionButton(
                        context,
                        icon: Icons.qr_code_scanner,
                        label: 'Scanner',
                        onTap: () {
                          // TODO: Implémenter le scan
                        },
                      ),
                      _buildQuickActionButton(
                        context,
                        icon: Icons.add_circle_outline,
                        label: 'Ajouter',
                        onTap: () => context.pushNamed('menu'),
                      ),
                      _buildQuickActionButton(
                        context,
                        icon: Icons.kitchen_outlined,
                        label: 'Garde-manger',
                        onTap: () => context.pushNamed('pantry'),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget child,
    Widget? action,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (action != null) action,
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildMealCard(
    BuildContext context, {
    required String title,
    required String time,
    required String meal,
    required String calories,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                time,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(meal),
                ],
              ),
            ),
            Text(
              calories,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingItem(BuildContext context, String item, String quantity) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_basket_outlined),
        title: Text(item),
        trailing: Text(
          quantity,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 