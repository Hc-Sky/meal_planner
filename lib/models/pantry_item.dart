import 'package:freezed_annotation/freezed_annotation.dart';

part 'pantry_item.freezed.dart';
part 'pantry_item.g.dart';

@freezed
class PantryItem with _$PantryItem {
  const factory PantryItem({
    required String id,
    required String userId,
    required String name,
    required double quantity,
    required String unit,
    required String category,
    DateTime? expirationDate,
    @Default(false) bool isLow,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PantryItem;

  factory PantryItem.fromJson(Map<String, dynamic> json) => _$PantryItemFromJson(json);
} 