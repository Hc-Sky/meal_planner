import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedRecipes() async {
  final firestore = FirebaseFirestore.instance;
  final recipesRef = firestore.collection('recipes');
  final now = DateTime.now().toIso8601String();

  final recipes = [
    {
      "name": "Omelette aux légumes",
      "description": "Une omelette rapide et saine.",
      "ingredients": [
        "4 œufs",
        "1 poivron",
        "1 oignon",
        "2 champignons",
        "Sel et poivre",
        "Huile d'olive"
      ],
      "instructions": [
        "Couper les légumes en petits morceaux",
        "Battre les œufs avec le sel et le poivre",
        "Faire revenir les légumes dans l'huile d'olive",
        "Verser les œufs battus et cuire à feu moyen",
        "Plier l'omelette en deux et servir"
      ],
      "preparationTime": 15,
      "calories": 350,
      "type": "breakfast",
      "tags": ["végétarien", "rapide", "protéiné"],
      "dietary": ["végétarien", "sans gluten"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Salade de quinoa",
      "description": "Salade fraîche et complète, idéale pour le déjeuner.",
      "ingredients": [
        "200g de quinoa",
        "1 concombre",
        "1 tomate",
        "1/2 oignon rouge",
        "Huile d'olive",
        "Jus de citron",
        "Sel et poivre"
      ],
      "instructions": [
        "Rincer le quinoa",
        "Cuire le quinoa dans l'eau bouillante",
        "Couper les légumes en dés",
        "Mélanger tous les ingrédients",
        "Assaisonner avec l'huile d'olive et le citron"
      ],
      "preparationTime": 25,
      "calories": 280,
      "type": "lunch",
      "tags": ["végétarien", "vegan", "sain"],
      "dietary": ["végétarien", "vegan", "sans gluten"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Poulet grillé aux herbes",
      "description": "Poulet tendre et parfumé aux herbes.",
      "ingredients": [
        "2 blancs de poulet",
        "Thym",
        "Romarin",
        "Ail",
        "Huile d'olive",
        "Sel et poivre"
      ],
      "instructions": [
        "Mariner le poulet avec les herbes et l'huile",
        "Faire chauffer la poêle",
        "Cuire le poulet 6-7 minutes de chaque côté",
        "Laisser reposer avant de servir"
      ],
      "preparationTime": 30,
      "calories": 450,
      "type": "dinner",
      "tags": ["protéiné", "sans gluten"],
      "dietary": ["sans gluten"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Smoothie bowl aux fruits",
      "description": "Petit-déjeuner vitaminé et gourmand.",
      "ingredients": [
        "1 banane",
        "100g de fruits rouges",
        "1 yaourt grec",
        "Miel",
        "Granola",
        "Noix de coco râpée"
      ],
      "instructions": [
        "Mixer la banane et les fruits rouges",
        "Ajouter le yaourt et le miel",
        "Verser dans un bol",
        "Garnir de granola et de noix de coco"
      ],
      "preparationTime": 10,
      "calories": 320,
      "type": "breakfast",
      "tags": ["végétarien", "sucré", "rapide"],
      "dietary": ["végétarien"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Wrap au poulet",
      "description": "Wraps frais et protéinés, parfaits pour emporter.",
      "ingredients": [
        "2 tortillas",
        "1 blanc de poulet",
        "Laitue",
        "Tomate",
        "Sauce au yaourt",
        "Sel et poivre"
      ],
      "instructions": [
        "Cuire le poulet et le couper en lamelles",
        "Étaler la sauce sur les tortillas",
        "Ajouter les légumes et le poulet",
        "Rouler les tortillas"
      ],
      "preparationTime": 20,
      "calories": 380,
      "type": "lunch",
      "tags": ["rapide", "protéiné"],
      "dietary": [],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Pâtes aux légumes",
      "description": "Un plat végétarien simple et savoureux.",
      "ingredients": [
        "200g de pâtes",
        "Courgette",
        "Poivron",
        "Oignon",
        "Sauce tomate",
        "Basilic",
        "Sel et poivre"
      ],
      "instructions": [
        "Cuire les pâtes",
        "Faire revenir les légumes",
        "Ajouter la sauce tomate",
        "Mélanger avec les pâtes",
        "Garnir de basilic"
      ],
      "preparationTime": 25,
      "calories": 420,
      "type": "dinner",
      "tags": ["végétarien", "rapide"],
      "dietary": ["végétarien"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Porridge aux fruits",
      "description": "Petit-déjeuner chaud et réconfortant.",
      "ingredients": [
        "50g de flocons d'avoine",
        "250ml de lait",
        "1 pomme",
        "Cannelle",
        "Miel",
        "Noix"
      ],
      "instructions": [
        "Faire cuire les flocons d'avoine dans le lait",
        "Couper la pomme en dés",
        "Ajouter la cannelle et le miel",
        "Garnir de pomme et de noix"
      ],
      "preparationTime": 15,
      "calories": 300,
      "type": "breakfast",
      "tags": ["végétarien", "sucré", "sain"],
      "dietary": ["végétarien"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Bowl de riz au saumon",
      "description": "Un bowl complet et équilibré.",
      "ingredients": [
        "150g de riz",
        "1 pavé de saumon",
        "Avocat",
        "Concombre",
        "Sauce soja",
        "Graines de sésame"
      ],
      "instructions": [
        "Cuire le riz",
        "Cuire le saumon",
        "Couper les légumes",
        "Assembler le bowl",
        "Arroser de sauce soja"
      ],
      "preparationTime": 30,
      "calories": 550,
      "type": "lunch",
      "tags": ["protéiné", "sain"],
      "dietary": ["sans gluten"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Curry de légumes",
      "description": "Un plat vegan épicé et nourrissant.",
      "ingredients": [
        "Pommes de terre",
        "Carottes",
        "Pois chiches",
        "Lait de coco",
        "Curry en poudre",
        "Riz basmati"
      ],
      "instructions": [
        "Couper les légumes",
        "Faire revenir les légumes",
        "Ajouter le curry et le lait de coco",
        "Laisser mijoter",
        "Servir avec le riz"
      ],
      "preparationTime": 40,
      "calories": 480,
      "type": "dinner",
      "tags": ["végétarien", "vegan", "épicé"],
      "dietary": ["végétarien", "vegan"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    },
    {
      "name": "Tartine avocat-œuf",
      "description": "Un classique healthy du petit-déjeuner.",
      "ingredients": [
        "2 tranches de pain complet",
        "1 avocat",
        "2 œufs",
        "Sel et poivre",
        "Piment en flocons",
        "Jus de citron"
      ],
      "instructions": [
        "Faire griller le pain",
        "Écraser l'avocat avec le citron",
        "Cuire les œufs",
        "Étaler l'avocat sur le pain",
        "Ajouter les œufs et assaisonner"
      ],
      "preparationTime": 15,
      "calories": 420,
      "type": "breakfast",
      "tags": ["végétarien", "protéiné", "rapide"],
      "dietary": ["végétarien"],
      "imageUrl": null,
      "createdAt": now,
      "updatedAt": now,
      "debug_route": true
    }
  ];

  // Supprimer les documents existants
  final existingDocs = await recipesRef.get();
  for (var doc in existingDocs.docs) {
    await doc.reference.delete();
  }

  // Ajouter les nouveaux documents
  for (var recipe in recipes) {
    await recipesRef.add(recipe);
  }

  print('Seed terminé : ${recipes.length} recettes ajoutées');
}