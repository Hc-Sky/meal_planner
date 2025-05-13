import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String id,
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
    required List<MenuDay> days,
    @Default(false) bool isGenerated,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@freezed
class MenuDay with _$MenuDay {
  const factory MenuDay({
    required DateTime date,
    required List<Meal> meals,
  }) = _MenuDay;

  factory MenuDay.fromJson(Map<String, dynamic> json) => _$MenuDayFromJson(json);
}

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String type, // breakfast, lunch, dinner, snack
    required Recipe recipe,
    @Default(false) bool isCompleted,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
} 