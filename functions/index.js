const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

// Base de données de recettes (dummy pour MVP)
const recipes = {
  breakfast: [
    {
      name: 'Porridge aux fruits',
      calories: 350,
      prepTime: 15,
      ingredients: ['Flocons d\'avoine', 'Lait', 'Fruits frais', 'Miel'],
      equipment: ['Casserole', 'Cuillère'],
      suitableFor: ['Sans restriction', 'Végétarien', 'Sans gluten'],
    },
    {
      name: 'Omelette aux légumes',
      calories: 400,
      prepTime: 20,
      ingredients: ['Œufs', 'Légumes', 'Fromage', 'Herbes'],
      equipment: ['Poêle', 'Fouet'],
      suitableFor: ['Sans restriction', 'Sans gluten'],
    },
  ],
  lunch: [
    {
      name: 'Salade de quinoa',
      calories: 450,
      prepTime: 25,
      ingredients: ['Quinoa', 'Légumes', 'Huile d\'olive', 'Citron'],
      equipment: ['Casserole', 'Saladier'],
      suitableFor: ['Sans restriction', 'Végétarien', 'Végétalien', 'Sans gluten'],
    },
    {
      name: 'Poulet aux légumes',
      calories: 550,
      prepTime: 35,
      ingredients: ['Poulet', 'Légumes', 'Herbes', 'Huile d\'olive'],
      equipment: ['Poêle', 'Four'],
      suitableFor: ['Sans restriction', 'Sans gluten'],
    },
  ],
  dinner: [
    {
      name: 'Poisson grillé',
      calories: 400,
      prepTime: 30,
      ingredients: ['Poisson', 'Légumes', 'Citron', 'Herbes'],
      equipment: ['Four', 'Plaque de cuisson'],
      suitableFor: ['Sans restriction', 'Sans gluten'],
    },
    {
      name: 'Risotto aux champignons',
      calories: 500,
      prepTime: 40,
      ingredients: ['Riz', 'Champignons', 'Vin blanc', 'Parmesan'],
      equipment: ['Casserole', 'Cuillère'],
      suitableFor: ['Sans restriction', 'Végétarien'],
    },
  ],
};

// Fonction pour générer un menu personnalisé
exports.generateMenu = functions.https.onCall(async (data, context) => {
  // Vérifier l'authentification
  if (!context.auth) {
    throw new functions.https.HttpsError(
      'unauthenticated',
      'L\'utilisateur doit être authentifié'
    );
  }

  const userId = context.auth.uid;
  const userProfile = data.profile;

  // Vérifier les données du profil
  if (!userProfile) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Le profil utilisateur est requis'
    );
  }

  try {
    // Générer un menu de 3 jours
    const menu = [];
    const days = 3;

    for (let day = 0; day < days; day++) {
      const dayMenu = {
        date: new Date(Date.now() + day * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
        meals: {
          breakfast: _selectRecipe('breakfast', userProfile),
          lunch: _selectRecipe('lunch', userProfile),
          dinner: _selectRecipe('dinner', userProfile),
        },
      };
      menu.push(dayMenu);
    }

    // Sauvegarder le menu dans Firestore
    const menuRef = admin.firestore().collection('menus').doc(userId);
    await menuRef.set({
      menu,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    return { success: true, menu };
  } catch (error) {
    console.error('Erreur lors de la génération du menu:', error);
    throw new functions.https.HttpsError(
      'internal',
      'Erreur lors de la génération du menu'
    );
  }
});

// Fonction utilitaire pour sélectionner une recette adaptée
function _selectRecipe(mealType, profile) {
  const availableRecipes = recipes[mealType].filter(recipe => {
    // Vérifier si la recette est compatible avec le régime alimentaire
    if (!recipe.suitableFor.includes(profile.diet)) {
      return false;
    }

    // Vérifier si l'utilisateur a les équipements nécessaires
    const hasEquipment = recipe.equipment.every(eq => 
      profile.equipment.includes(eq)
    );
    if (!hasEquipment) {
      return false;
    }

    // Vérifier si la recette contient des allergènes
    const hasAllergens = recipe.ingredients.some(ingredient =>
      profile.allergies.includes(ingredient)
    );
    if (hasAllergens) {
      return false;
    }

    // Vérifier le temps de préparation
    if (recipe.prepTime > profile.prepTime) {
      return false;
    }

    return true;
  });

  // Si aucune recette n'est disponible, retourner une recette par défaut
  if (availableRecipes.length === 0) {
    return {
      name: 'Recette par défaut',
      calories: 500,
      prepTime: 30,
      ingredients: ['Ingrédient 1', 'Ingrédient 2'],
      equipment: ['Équipement de base'],
      suitableFor: ['Sans restriction'],
    };
  }

  // Sélectionner une recette aléatoire parmi les recettes disponibles
  return availableRecipes[Math.floor(Math.random() * availableRecipes.length)];
} 