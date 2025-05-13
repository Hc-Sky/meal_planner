// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

 String get id; String get name; String get description; List<String> get ingredients; List<String> get instructions; int get preparationTime; int get cookingTime; int get servings; String get difficulty; List<String> get tags; String? get imageUrl; double get rating; int get reviewCount; String? get userId; bool get isPublic; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.instructions, instructions)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(instructions),preparationTime,cookingTime,servings,difficulty,const DeepCollectionEquality().hash(tags),imageUrl,rating,reviewCount,userId,isPublic,createdAt,updatedAt);

@override
String toString() {
  return 'Recipe(id: $id, name: $name, description: $description, ingredients: $ingredients, instructions: $instructions, preparationTime: $preparationTime, cookingTime: $cookingTime, servings: $servings, difficulty: $difficulty, tags: $tags, imageUrl: $imageUrl, rating: $rating, reviewCount: $reviewCount, userId: $userId, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, List<String> ingredients, List<String> instructions, int preparationTime, int cookingTime, int servings, String difficulty, List<String> tags, String? imageUrl, double rating, int reviewCount, String? userId, bool isPublic, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? ingredients = null,Object? instructions = null,Object? preparationTime = null,Object? cookingTime = null,Object? servings = null,Object? difficulty = null,Object? tags = null,Object? imageUrl = freezed,Object? rating = null,Object? reviewCount = null,Object? userId = freezed,Object? isPublic = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,preparationTime: null == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int,cookingTime: null == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({required this.id, required this.name, required this.description, required final  List<String> ingredients, required final  List<String> instructions, required this.preparationTime, required this.cookingTime, required this.servings, required this.difficulty, final  List<String> tags = const [], this.imageUrl, this.rating = 0, this.reviewCount = 0, this.userId, this.isPublic = false, this.createdAt, this.updatedAt}): _ingredients = ingredients,_instructions = instructions,_tags = tags;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
 final  List<String> _ingredients;
@override List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<String> _instructions;
@override List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

@override final  int preparationTime;
@override final  int cookingTime;
@override final  int servings;
@override final  String difficulty;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? imageUrl;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
@override final  String? userId;
@override@JsonKey() final  bool isPublic;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._instructions, _instructions)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_instructions),preparationTime,cookingTime,servings,difficulty,const DeepCollectionEquality().hash(_tags),imageUrl,rating,reviewCount,userId,isPublic,createdAt,updatedAt);

@override
String toString() {
  return 'Recipe(id: $id, name: $name, description: $description, ingredients: $ingredients, instructions: $instructions, preparationTime: $preparationTime, cookingTime: $cookingTime, servings: $servings, difficulty: $difficulty, tags: $tags, imageUrl: $imageUrl, rating: $rating, reviewCount: $reviewCount, userId: $userId, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, List<String> ingredients, List<String> instructions, int preparationTime, int cookingTime, int servings, String difficulty, List<String> tags, String? imageUrl, double rating, int reviewCount, String? userId, bool isPublic, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? ingredients = null,Object? instructions = null,Object? preparationTime = null,Object? cookingTime = null,Object? servings = null,Object? difficulty = null,Object? tags = null,Object? imageUrl = freezed,Object? rating = null,Object? reviewCount = null,Object? userId = freezed,Object? isPublic = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,preparationTime: null == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int,cookingTime: null == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
