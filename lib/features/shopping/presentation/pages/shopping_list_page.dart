import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_planner/models/shopping_item.dart';

class ShoppingListPage extends ConsumerWidget {
  final String userId;

  const ShoppingListPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingItemsAsync = ref.watch(shoppingItemsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add manual item
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () => _clearCheckedItems(context, ref),
          ),
        ],
      ),
      body: shoppingItemsAsync.when(
        data: (items) => _buildShoppingList(context, ref, items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }

  Widget _buildShoppingList(
    BuildContext context,
    WidgetRef ref,
    List<ShoppingItem> items,
  ) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Your shopping list is empty. Add some items!'),
      );
    }

    // Group items by category
    final groupedItems = <String, List<ShoppingItem>>{};
    for (final item in items) {
      groupedItems.putIfAbsent(item.category, () => []).add(item);
    }

    // Sort categories alphabetically
    final sortedCategories = groupedItems.keys.toList()..sort();

    return ListView.builder(
      itemCount: sortedCategories.length,
      itemBuilder: (context, index) {
        final category = sortedCategories[index];
        final categoryItems = groupedItems[category]!;
        
        // Sort items by name within category
        categoryItems.sort((a, b) => a.name.compareTo(b.name));

        return _CategorySection(
          category: category,
          items: categoryItems,
          onItemChecked: (item, isChecked) => _toggleItemChecked(context, ref, item, isChecked),
          onItemDeleted: (item) => _deleteItem(context, ref, item),
        );
      },
    );
  }

  Future<void> _toggleItemChecked(
    BuildContext context,
    WidgetRef ref,
    ShoppingItem item,
    bool isChecked,
  ) async {
    try {
      final updatedItem = item.copyWith(isChecked: isChecked);
      await ref.read(updateShoppingItemProvider(updatedItem).future);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating item: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteItem(
    BuildContext context,
    WidgetRef ref,
    ShoppingItem item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: Text('Are you sure you want to delete ${item.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await ref.read(deleteShoppingItemProvider(item.id).future);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item deleted successfully')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting item: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _clearCheckedItems(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Checked Items'),
        content: const Text('Are you sure you want to remove all checked items?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final items = await ref.read(shoppingItemsProvider(userId).future);
        final checkedItems = items.where((item) => item.isChecked).toList();
        
        for (final item in checkedItems) {
          await ref.read(deleteShoppingItemProvider(item.id).future);
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Checked items cleared successfully')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error clearing items: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

class _CategorySection extends StatelessWidget {
  final String category;
  final List<ShoppingItem> items;
  final Function(ShoppingItem, bool) onItemChecked;
  final Function(ShoppingItem) onItemDeleted;

  const _CategorySection({
    required this.category,
    required this.items,
    required this.onItemChecked,
    required this.onItemDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            category,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        ...items.map((item) => _ShoppingItemTile(
              item: item,
              onChecked: (isChecked) => onItemChecked(item, isChecked),
              onDeleted: () => onItemDeleted(item),
            )),
      ],
    );
  }
}

class _ShoppingItemTile extends StatelessWidget {
  final ShoppingItem item;
  final Function(bool) onChecked;
  final VoidCallback onDeleted;

  const _ShoppingItemTile({
    required this.item,
    required this.onChecked,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: item.isChecked,
          onChanged: (value) => onChecked(value ?? false),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('${item.quantity} ${item.unit}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDeleted,
        ),
      ),
    );
  }
} 