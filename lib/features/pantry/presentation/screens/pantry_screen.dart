import 'package:flutter/material.dart';
import '../widgets/add_ingredient_widget.dart';

class PantryScreen extends StatefulWidget {
  const PantryScreen({super.key});

  @override
  State<PantryScreen> createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  final List<String> _ingredients = [];

  void _addIngredient(String ingredient) {
    setState(() {
      _ingredients.add(ingredient);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Garde-manger'),
            backgroundColor: theme.colorScheme.inversePrimary,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AddIngredientWidget(onAdd: _addIngredient),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Ingrédients dans le frigo :',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (_ingredients.isEmpty)
                  const Text('Aucun ingrédient pour le moment.')
                else
                  ..._ingredients.map((ingredient) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: const Icon(Icons.kitchen_outlined),
                          title: Text(ingredient),
                        ),
                      )),
              ]),
            ),
          ),
        ],
      ),
    );
  }
} 