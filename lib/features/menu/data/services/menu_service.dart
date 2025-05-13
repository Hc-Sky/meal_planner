import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuServiceProvider = Provider<MenuService>((ref) {
  return MenuService();
});

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Base de données de recettes (à déplacer dans Firestore plus tard)
  final Map<String, List<Map<String, dynamic>>> _recipes = {
    'breakfast': [
      {
        'name': 'Oatmeal aux fruits',
        'calories': 350,
        'preparationTime': 15,
        'ingredients': ['Flocons d\'avoine', 'Lait', 'Fruits frais', 'Miel'],
        'equipment': ['Casserole', 'Cuillère'],
        'dietary': ['vegetarian', 'vegan'],
      },
      {
        'name': 'Omelette aux légumes',
        'calories': 400,
        'preparationTime': 20,
        'ingredients': ['Œufs', 'Légumes', 'Fromage', 'Herbes'],
        'equipment': ['Poêle', 'Fouet'],
        'dietary': ['vegetarian'],
      },
    ],
    'lunch': [
      {
        'name': 'Salade de quinoa',
        'calories': 450,
        'preparationTime': 25,
        'ingredients': ['Quinoa', 'Légumes', 'Vinaigrette', 'Noix'],
        'equipment': ['Casserole', 'Saladier'],
        'dietary': ['vegetarian', 'vegan', 'gluten-free'],
      },
      {
        'name': 'Wrap au poulet',
        'calories': 500,
        'preparationTime': 20,
        'ingredients': ['Tortilla', 'Poulet', 'Légumes', 'Sauce'],
        'equipment': ['Planche à découper', 'Couteau'],
        'dietary': ['gluten-free'],
      },
    ],
    'dinner': [
      {
        'name': 'Poulet grillé aux légumes',
        'calories': 550,
        'preparationTime': 35,
        'ingredients': ['Poulet', 'Légumes', 'Herbes', 'Huile d\'olive'],
        'equipment': ['Four', 'Plat de cuisson'],
        'dietary': ['gluten-free'],
      },
      {
        'name': 'Pâtes aux légumes',
        'calories': 500,
        'preparationTime': 25,
        'ingredients': ['Pâtes', 'Légumes', 'Sauce tomate', 'Herbes'],
        'equipment': ['Casserole', 'Poêle'],
        'dietary': ['vegetarian'],
      },
    ],
  };

  Future<Map<String, dynamic>> generateMenu(Map<String, dynamic> profile) async {
    try {
      final menu = _generateMenuForProfile(profile);
      
      // Sauvegarder le menu dans Firestore
      await _firestore
          .collection('menus')
          .doc(profile['userId'])
          .set(menu);

      return menu;
    } catch (e) {
      throw Exception('Erreur lors de la génération du menu: $e');
    }
  }

  Map<String, dynamic> _generateMenuForProfile(Map<String, dynamic> profile) {
    final menu = {
      'userId': profile['userId'],
      'generatedAt': DateTime.now().toIso8601String(),
      'days': List.generate(3, (index) {
        final date = DateTime.now().add(Duration(days: index));
        return {
          'date': date.toIso8601String(),
          'meals': {
            'breakfast': _selectRecipe('breakfast', profile),
            'lunch': _selectRecipe('lunch', profile),
            'dinner': _selectRecipe('dinner', profile),
          },
        };
      }),
    };

    return menu;
  }

  Map<String, dynamic> _selectRecipe(String mealType, Map<String, dynamic> profile) {
    final availableRecipes = _recipes[mealType]!.where((recipe) {
      // Vérifier les restrictions alimentaires
      if (profile['dietary'] != null && 
          !recipe['dietary'].any((diet) => profile['dietary'].contains(diet))) {
        return false;
      }

      // Vérifier le temps de préparation
      if (profile['maxPreparationTime'] != null && 
          recipe['preparationTime'] > profile['maxPreparationTime']) {
        return false;
      }

      // Vérifier l'équipement disponible
      if (profile['equipment'] != null && 
          !recipe['equipment'].every((item) => profile['equipment'].contains(item))) {
        return false;
      }

      return true;
    }).toList();

    if (availableRecipes.isEmpty) {
      // Retourner une recette par défaut si aucune ne correspond aux critères
      return _recipes[mealType]!.first;
    }

    // Sélectionner une recette aléatoire parmi celles disponibles
    return availableRecipes[DateTime.now().millisecondsSinceEpoch % availableRecipes.length];
  }
} 