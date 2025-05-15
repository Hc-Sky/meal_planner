import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String description,
    required List<String> ingredients,
    required List<String> instructions,
    required int preparationTime, // en minutes
    required int calories,
    required String type, // breakfast, lunch, dinner, snack
    @Default([]) List<String> tags, // ex: ["végétarien", "rapide"]
    @Default([]) List<String> dietary, // ex: ["végétarien", "sans gluten"]
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
} 