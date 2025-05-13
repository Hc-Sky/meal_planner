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
    required int preparationTime,
    required int cookingTime,
    required int servings,
    required String difficulty,
    @Default([]) List<String> tags,
    String? imageUrl,
    @Default(0) double rating,
    @Default(0) int reviewCount,
    String? userId,
    @Default(false) bool isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
} 