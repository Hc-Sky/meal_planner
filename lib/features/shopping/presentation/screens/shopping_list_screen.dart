import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // Exemple de menus générés (à remplacer par la vraie source)
  final List<Map<String, dynamic>> _menus = [
    {
      'days': [
        {
          'meals': {
            'breakfast': {
              'ingredients': ['Lait', 'Flocons d\'avoine', 'Fruits frais', 'Miel']
            },
            'lunch': {
              'ingredients': ['Quinoa', 'Légumes', 'Vinaigrette', 'Noix']
            },
            'dinner': {
              'ingredients': ['Poulet', 'Légumes', 'Herbes', 'Huile d\'olive']
            },
          }
        },
        {
          'meals': {
            'breakfast': {
              'ingredients': ['Œufs', 'Légumes', 'Fromage', 'Herbes']
            },
            'lunch': {
              'ingredients': ['Tortilla', 'Poulet', 'Légumes', 'Sauce']
            },
            'dinner': {
              'ingredients': ['Pâtes', 'Légumes', 'Sauce tomate', 'Herbes']
            },
          }
        },
      ]
    }
  ];

  late Map<String, List<String>> _groupedIngredients;
  late Map<String, Set<String>> _checkedIngredients;

  @override
  void initState() {
    super.initState();
    _groupedIngredients = _computeGroupedIngredients();
    _checkedIngredients = {
      for (final type in _groupedIngredients.keys)
        type: <String>{}
    };
  }

  String _ingredientType(String ingredient) {
    final lower = ingredient.toLowerCase();
    if (lower.contains('pomme') || lower.contains('fruits')) return 'Fruits';
    if (lower.contains('légume') || lower.contains('salade') || lower.contains('quinoa')) return 'Légumes';
    if (lower.contains('poulet') || lower.contains('œuf') || lower.contains('viande')) return 'Viandes';
    if (lower.contains('lait') || lower.contains('fromage')) return 'Produits laitiers';
    if (lower.contains('pâtes') || lower.contains('tortilla')) return 'Féculents';
    if (lower.contains('huile') || lower.contains('vinaigrette') || lower.contains('sauce')) return 'Assaisonnements';
    if (lower.contains('miel') || lower.contains('noix')) return 'Autres';
    return 'Autres';
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'Fruits':
        return Icons.apple;
      case 'Légumes':
        return Icons.eco_outlined;
      case 'Viandes':
        return Icons.set_meal_outlined;
      case 'Produits laitiers':
        return Icons.icecream_outlined;
      case 'Féculents':
        return Icons.rice_bowl_outlined;
      case 'Assaisonnements':
        return Icons.spa_outlined;
      default:
        return Icons.shopping_basket_outlined;
    }
  }

  Map<String, List<String>> _computeGroupedIngredients() {
    final allIngredients = <String>[];
    for (final menu in _menus) {
      for (final day in menu['days']) {
        for (final meal in day['meals'].values) {
          allIngredients.addAll(List<String>.from(meal['ingredients']));
        }
      }
    }
    // Regrouper par type réel
    final Map<String, List<String>> grouped = {};
    for (final ingredient in allIngredients) {
      final type = _ingredientType(ingredient);
      grouped.putIfAbsent(type, () => []).add(ingredient);
    }
    // Supprimer les doublons dans chaque groupe
    for (final type in grouped.keys) {
      grouped[type] = grouped[type]!.toSet().toList();
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.2),
      appBar: AppBar(title: const Text('Liste de courses')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final type in _groupedIngredients.keys)
            Card(
              margin: const EdgeInsets.only(bottom: 20),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(_iconForType(type), color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          type,
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ..._groupedIngredients[type]!.map((ingredient) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: CheckboxListTile(
                            key: ValueKey(_checkedIngredients[type]!.contains(ingredient)),
                            title: Text(ingredient),
                            value: _checkedIngredients[type]!.contains(ingredient),
                            activeColor: theme.colorScheme.primary,
                            onChanged: (checked) {
                              setState(() {
                                if (checked == true) {
                                  _checkedIngredients[type]!.add(ingredient);
                                } else {
                                  _checkedIngredients[type]!.remove(ingredient);
                                }
                              });
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
} 