// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  photoUrl: json['photoUrl'] as String?,
  dietaryRestrictions:
      (json['dietaryRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  allergies:
      (json['allergies'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  favoriteRecipes:
      (json['favoriteRecipes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isPremium: json['isPremium'] as bool? ?? false,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'photoUrl': instance.photoUrl,
  'dietaryRestrictions': instance.dietaryRestrictions,
  'allergies': instance.allergies,
  'favoriteRecipes': instance.favoriteRecipes,
  'isPremium': instance.isPremium,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
