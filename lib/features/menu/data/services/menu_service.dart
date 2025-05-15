import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuServiceProvider = Provider<MenuService>((ref) {
  return MenuService();
});

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> generateMenu(Map<String, dynamic> profile) async {
    try {
      // Récupérer toutes les recettes de la collection recipes
      final recipesSnapshot = await _firestore.collection('recipes').get();
      
      if (recipesSnapshot.docs.isEmpty) {
        throw Exception('Aucune recette disponible dans la base de données');
      }

      // Convertir les documents en liste de recettes
      final allRecipes = recipesSnapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        // Conversion explicite des listes dynamiques en List<String>
        data['dietary'] = (data['dietary'] as List?)?.map((e) => e.toString()).toList() ?? [];
        data['equipment'] = (data['equipment'] as List?)?.map((e) => e.toString()).toList() ?? [];
        data['ingredients'] = (data['ingredients'] as List?)?.map((e) => e.toString()).toList() ?? [];
        data['tags'] = (data['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];
        return data;
      }).toList();

      // Filtrer les recettes selon les préférences de l'utilisateur
      final filteredRecipes = allRecipes.where((recipe) {
        // Vérifier les restrictions alimentaires
        final dietaryRestrictions = (profile['dietaryRestrictions'] as List?)?.map((e) => e.toString()).toList() ?? [];
        final recipeDietary = (recipe['dietary'] as List?)?.map((e) => e.toString()).toList() ?? [];
        if (dietaryRestrictions.isNotEmpty && 
            !recipeDietary.any((diet) => dietaryRestrictions.contains(diet))) {
          return false;
        }

        // Vérifier le temps de préparation
        final maxPrepTime = profile['maxPreparationTime'] as int?;
        final prepTime = recipe['preparationTime'] as int?;
        if (maxPrepTime != null && prepTime != null && prepTime > maxPrepTime) {
          return false;
        }
        
        // Vérifier l'équipement disponible (optionnel)
        final userEquipment = (profile['equipment'] as List?)?.map((e) => e.toString()).toList() ?? [];
        final recipeEquipment = (recipe['equipment'] as List?)?.map((e) => e.toString()).toList() ?? [];
        if (userEquipment.isNotEmpty && recipeEquipment.isNotEmpty) {
          final missingEquipment = recipeEquipment
              .where((item) => !userEquipment.contains(item))
              .toList();
          if (missingEquipment.isNotEmpty) {
            return false;
          }
        }

        // Vérifier les allergies
        final allergies = (profile['allergies'] as List?)?.map((e) => e.toString()).toList() ?? [];
        final ingredients = (recipe['ingredients'] as List?)?.map((e) => e.toString()).toList() ?? [];
        if (allergies.isNotEmpty && 
            ingredients.any((ingredient) => allergies.contains(ingredient))) {
          return false;
        }

        // Vérifier les tags
        final userTags = (profile['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];
        final recipeTags = (recipe['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];
        if (userTags.isEmpty || recipeTags.isEmpty) {
          return true; // Si pas de tags, on accepte la recette
        }
        return recipeTags.any((tag) => userTags.contains(tag));
      }).toList();

      if (filteredRecipes.isEmpty) {
        throw Exception('Aucune recette ne correspond à vos critères');
      }

      // Générer le menu pour 3 jours
      final menu = {
        'userId': profile['userId'],
        'generatedAt': DateTime.now().toIso8601String(),
        'days': List.generate(3, (index) {
          final date = DateTime.now().add(Duration(days: index));
          return {
            'date': date.toIso8601String(),
            'meals': {
              'breakfast': _selectRandomRecipe(filteredRecipes, 'breakfast'),
              'lunch': _selectRandomRecipe(filteredRecipes, 'lunch'),
              'dinner': _selectRandomRecipe(filteredRecipes, 'dinner'),
            },
          };
        }),
      };

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

  Map<String, dynamic> _selectRandomRecipe(List<Map<String, dynamic>> recipes, String mealType) {
    // Filtrer les recettes par type de repas
    final mealRecipes = recipes.where((recipe) => recipe['type'] == mealType).toList();
    
    if (mealRecipes.isEmpty) {
      // Si aucune recette n'est disponible pour ce type de repas, prendre une recette aléatoire
      return recipes[DateTime.now().millisecondsSinceEpoch % recipes.length];
    }

    // Sélectionner une recette aléatoire parmi celles disponibles pour ce type de repas
    return mealRecipes[DateTime.now().millisecondsSinceEpoch % mealRecipes.length];
  }
} 