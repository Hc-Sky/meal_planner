// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PantryItem {

 String get id; String get userId; String get name; double get quantity; String get unit; String get category; DateTime? get expirationDate; bool get isLow; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryItemCopyWith<PantryItem> get copyWith => _$PantryItemCopyWithImpl<PantryItem>(this as PantryItem, _$identity);

  /// Serializes this PantryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.isLow, isLow) || other.isLow == isLow)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,quantity,unit,category,expirationDate,isLow,createdAt,updatedAt);

@override
String toString() {
  return 'PantryItem(id: $id, userId: $userId, name: $name, quantity: $quantity, unit: $unit, category: $category, expirationDate: $expirationDate, isLow: $isLow, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PantryItemCopyWith<$Res>  {
  factory $PantryItemCopyWith(PantryItem value, $Res Function(PantryItem) _then) = _$PantryItemCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, double quantity, String unit, String category, DateTime? expirationDate, bool isLow, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$PantryItemCopyWithImpl<$Res>
    implements $PantryItemCopyWith<$Res> {
  _$PantryItemCopyWithImpl(this._self, this._then);

  final PantryItem _self;
  final $Res Function(PantryItem) _then;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? category = null,Object? expirationDate = freezed,Object? isLow = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLow: null == isLow ? _self.isLow : isLow // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PantryItem implements PantryItem {
  const _PantryItem({required this.id, required this.userId, required this.name, required this.quantity, required this.unit, required this.category, this.expirationDate, this.isLow = false, this.createdAt, this.updatedAt});
  factory _PantryItem.fromJson(Map<String, dynamic> json) => _$PantryItemFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override final  double quantity;
@override final  String unit;
@override final  String category;
@override final  DateTime? expirationDate;
@override@JsonKey() final  bool isLow;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryItemCopyWith<_PantryItem> get copyWith => __$PantryItemCopyWithImpl<_PantryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PantryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.category, category) || other.category == category)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.isLow, isLow) || other.isLow == isLow)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,quantity,unit,category,expirationDate,isLow,createdAt,updatedAt);

@override
String toString() {
  return 'PantryItem(id: $id, userId: $userId, name: $name, quantity: $quantity, unit: $unit, category: $category, expirationDate: $expirationDate, isLow: $isLow, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PantryItemCopyWith<$Res> implements $PantryItemCopyWith<$Res> {
  factory _$PantryItemCopyWith(_PantryItem value, $Res Function(_PantryItem) _then) = __$PantryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, double quantity, String unit, String category, DateTime? expirationDate, bool isLow, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$PantryItemCopyWithImpl<$Res>
    implements _$PantryItemCopyWith<$Res> {
  __$PantryItemCopyWithImpl(this._self, this._then);

  final _PantryItem _self;
  final $Res Function(_PantryItem) _then;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? category = null,Object? expirationDate = freezed,Object? isLow = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PantryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLow: null == isLow ? _self.isLow : isLow // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
