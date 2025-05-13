// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryItem _$PantryItemFromJson(Map<String, dynamic> json) => _PantryItem(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  unit: json['unit'] as String,
  category: json['category'] as String,
  expirationDate:
      json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
  isLow: json['isLow'] as bool? ?? false,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PantryItemToJson(_PantryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'category': instance.category,
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'isLow': instance.isLow,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
