import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const factory ShoppingItem({
    required String id,
    required String userId,
    required String name,
    required double quantity,
    required String unit,
    required String category,
    @Default(false) bool isChecked,
    String? recipeId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);
} 