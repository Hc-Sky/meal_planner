// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingItem {

 String get id; String get userId; String get name; double get quantity; String get unit; String get category; bool get isChecked; String? get recipeId; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemCopyWith<ShoppingItem> get copyWith => _$ShoppingItemCopyWithImpl<ShoppingItem>(this as ShoppingItem, _$identity);

  /// Serializes this ShoppingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,quantity,unit,category,isChecked,recipeId,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingItem(id: $id, userId: $userId, name: $name, quantity: $quantity, unit: $unit, category: $category, isChecked: $isChecked, recipeId: $recipeId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemCopyWith<$Res>  {
  factory $ShoppingItemCopyWith(ShoppingItem value, $Res Function(ShoppingItem) _then) = _$ShoppingItemCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, double quantity, String unit, String category, bool isChecked, String? recipeId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._self, this._then);

  final ShoppingItem _self;
  final $Res Function(ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? category = null,Object? isChecked = null,Object? recipeId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShoppingItem implements ShoppingItem {
  const _ShoppingItem({required this.id, required this.userId, required this.name, required this.quantity, required this.unit, required this.category, this.isChecked = false, this.recipeId, this.createdAt, this.updatedAt});
  factory _ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override final  double quantity;
@override final  String unit;
@override final  String category;
@override@JsonKey() final  bool isChecked;
@override final  String? recipeId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemCopyWith<_ShoppingItem> get copyWith => __$ShoppingItemCopyWithImpl<_ShoppingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,quantity,unit,category,isChecked,recipeId,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingItem(id: $id, userId: $userId, name: $name, quantity: $quantity, unit: $unit, category: $category, isChecked: $isChecked, recipeId: $recipeId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemCopyWith<$Res> implements $ShoppingItemCopyWith<$Res> {
  factory _$ShoppingItemCopyWith(_ShoppingItem value, $Res Function(_ShoppingItem) _then) = __$ShoppingItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, double quantity, String unit, String category, bool isChecked, String? recipeId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ShoppingItemCopyWithImpl<$Res>
    implements _$ShoppingItemCopyWith<$Res> {
  __$ShoppingItemCopyWithImpl(this._self, this._then);

  final _ShoppingItem _self;
  final $Res Function(_ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? category = null,Object? isChecked = null,Object? recipeId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ShoppingItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
