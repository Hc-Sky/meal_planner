// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Menu {

 String get id; String get userId; DateTime get startDate; DateTime get endDate; List<MenuDay> get days; bool get isGenerated; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCopyWith<Menu> get copyWith => _$MenuCopyWithImpl<Menu>(this as Menu, _$identity);

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Menu&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.isGenerated, isGenerated) || other.isGenerated == isGenerated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,startDate,endDate,const DeepCollectionEquality().hash(days),isGenerated,createdAt,updatedAt);

@override
String toString() {
  return 'Menu(id: $id, userId: $userId, startDate: $startDate, endDate: $endDate, days: $days, isGenerated: $isGenerated, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MenuCopyWith<$Res>  {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) _then) = _$MenuCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime startDate, DateTime endDate, List<MenuDay> days, bool isGenerated, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$MenuCopyWithImpl<$Res>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._self, this._then);

  final Menu _self;
  final $Res Function(Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? startDate = null,Object? endDate = null,Object? days = null,Object? isGenerated = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<MenuDay>,isGenerated: null == isGenerated ? _self.isGenerated : isGenerated // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Menu implements Menu {
  const _Menu({required this.id, required this.userId, required this.startDate, required this.endDate, required final  List<MenuDay> days, this.isGenerated = false, this.createdAt, this.updatedAt}): _days = days;
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime startDate;
@override final  DateTime endDate;
 final  List<MenuDay> _days;
@override List<MenuDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override@JsonKey() final  bool isGenerated;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCopyWith<_Menu> get copyWith => __$MenuCopyWithImpl<_Menu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Menu&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.isGenerated, isGenerated) || other.isGenerated == isGenerated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,startDate,endDate,const DeepCollectionEquality().hash(_days),isGenerated,createdAt,updatedAt);

@override
String toString() {
  return 'Menu(id: $id, userId: $userId, startDate: $startDate, endDate: $endDate, days: $days, isGenerated: $isGenerated, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) _then) = __$MenuCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime startDate, DateTime endDate, List<MenuDay> days, bool isGenerated, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(this._self, this._then);

  final _Menu _self;
  final $Res Function(_Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? startDate = null,Object? endDate = null,Object? days = null,Object? isGenerated = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Menu(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<MenuDay>,isGenerated: null == isGenerated ? _self.isGenerated : isGenerated // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MenuDay {

 DateTime get date; List<Meal> get meals;
/// Create a copy of MenuDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuDayCopyWith<MenuDay> get copyWith => _$MenuDayCopyWithImpl<MenuDay>(this as MenuDay, _$identity);

  /// Serializes this MenuDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuDay&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.meals, meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(meals));

@override
String toString() {
  return 'MenuDay(date: $date, meals: $meals)';
}


}

/// @nodoc
abstract mixin class $MenuDayCopyWith<$Res>  {
  factory $MenuDayCopyWith(MenuDay value, $Res Function(MenuDay) _then) = _$MenuDayCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<Meal> meals
});




}
/// @nodoc
class _$MenuDayCopyWithImpl<$Res>
    implements $MenuDayCopyWith<$Res> {
  _$MenuDayCopyWithImpl(this._self, this._then);

  final MenuDay _self;
  final $Res Function(MenuDay) _then;

/// Create a copy of MenuDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? meals = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as List<Meal>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MenuDay implements MenuDay {
  const _MenuDay({required this.date, required final  List<Meal> meals}): _meals = meals;
  factory _MenuDay.fromJson(Map<String, dynamic> json) => _$MenuDayFromJson(json);

@override final  DateTime date;
 final  List<Meal> _meals;
@override List<Meal> get meals {
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meals);
}


/// Create a copy of MenuDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuDayCopyWith<_MenuDay> get copyWith => __$MenuDayCopyWithImpl<_MenuDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuDay&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._meals, _meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_meals));

@override
String toString() {
  return 'MenuDay(date: $date, meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$MenuDayCopyWith<$Res> implements $MenuDayCopyWith<$Res> {
  factory _$MenuDayCopyWith(_MenuDay value, $Res Function(_MenuDay) _then) = __$MenuDayCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<Meal> meals
});




}
/// @nodoc
class __$MenuDayCopyWithImpl<$Res>
    implements _$MenuDayCopyWith<$Res> {
  __$MenuDayCopyWithImpl(this._self, this._then);

  final _MenuDay _self;
  final $Res Function(_MenuDay) _then;

/// Create a copy of MenuDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? meals = null,}) {
  return _then(_MenuDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,meals: null == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<Meal>,
  ));
}


}


/// @nodoc
mixin _$Meal {

 String get type;// breakfast, lunch, dinner, snack
 Recipe get recipe; bool get isCompleted;
/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealCopyWith<Meal> get copyWith => _$MealCopyWithImpl<Meal>(this as Meal, _$identity);

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meal&&(identical(other.type, type) || other.type == type)&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,recipe,isCompleted);

@override
String toString() {
  return 'Meal(type: $type, recipe: $recipe, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $MealCopyWith<$Res>  {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) = _$MealCopyWithImpl;
@useResult
$Res call({
 String type, Recipe recipe, bool isCompleted
});


$RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class _$MealCopyWithImpl<$Res>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._self, this._then);

  final Meal _self;
  final $Res Function(Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? recipe = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Meal implements Meal {
  const _Meal({required this.type, required this.recipe, this.isCompleted = false});
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

@override final  String type;
// breakfast, lunch, dinner, snack
@override final  Recipe recipe;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealCopyWith<_Meal> get copyWith => __$MealCopyWithImpl<_Meal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meal&&(identical(other.type, type) || other.type == type)&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,recipe,isCompleted);

@override
String toString() {
  return 'Meal(type: $type, recipe: $recipe, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) = __$MealCopyWithImpl;
@override @useResult
$Res call({
 String type, Recipe recipe, bool isCompleted
});


@override $RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class __$MealCopyWithImpl<$Res>
    implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(this._self, this._then);

  final _Meal _self;
  final $Res Function(_Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? recipe = null,Object? isCompleted = null,}) {
  return _then(_Meal(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
