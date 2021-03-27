// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'law_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LawCategory _$LawCategoryFromJson(Map<String, dynamic> json) {
  return _LawCategory.fromJson(json);
}

/// @nodoc
class _$LawCategoryTearOff {
  const _$LawCategoryTearOff();

  _LawCategory call(
      {String name = "", String description = "", String coverUrl = ""}) {
    return _LawCategory(
      name: name,
      description: description,
      coverUrl: coverUrl,
    );
  }

  LawCategory fromJson(Map<String, Object> json) {
    return LawCategory.fromJson(json);
  }
}

/// @nodoc
const $LawCategory = _$LawCategoryTearOff();

/// @nodoc
mixin _$LawCategory {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LawCategoryCopyWith<LawCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawCategoryCopyWith<$Res> {
  factory $LawCategoryCopyWith(
          LawCategory value, $Res Function(LawCategory) then) =
      _$LawCategoryCopyWithImpl<$Res>;
  $Res call({String name, String description, String coverUrl});
}

/// @nodoc
class _$LawCategoryCopyWithImpl<$Res> implements $LawCategoryCopyWith<$Res> {
  _$LawCategoryCopyWithImpl(this._value, this._then);

  final LawCategory _value;
  // ignore: unused_field
  final $Res Function(LawCategory) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LawCategoryCopyWith<$Res>
    implements $LawCategoryCopyWith<$Res> {
  factory _$LawCategoryCopyWith(
          _LawCategory value, $Res Function(_LawCategory) then) =
      __$LawCategoryCopyWithImpl<$Res>;
  @override
  $Res call({String name, String description, String coverUrl});
}

/// @nodoc
class __$LawCategoryCopyWithImpl<$Res> extends _$LawCategoryCopyWithImpl<$Res>
    implements _$LawCategoryCopyWith<$Res> {
  __$LawCategoryCopyWithImpl(
      _LawCategory _value, $Res Function(_LawCategory) _then)
      : super(_value, (v) => _then(v as _LawCategory));

  @override
  _LawCategory get _value => super._value as _LawCategory;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_LawCategory(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LawCategory implements _LawCategory {
  _$_LawCategory({this.name = "", this.description = "", this.coverUrl = ""});

  factory _$_LawCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_LawCategoryFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String description;
  @JsonKey(defaultValue: "")
  @override
  final String coverUrl;

  @override
  String toString() {
    return 'LawCategory(name: $name, description: $description, coverUrl: $coverUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LawCategory &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.coverUrl, coverUrl) ||
                const DeepCollectionEquality()
                    .equals(other.coverUrl, coverUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(coverUrl);

  @JsonKey(ignore: true)
  @override
  _$LawCategoryCopyWith<_LawCategory> get copyWith =>
      __$LawCategoryCopyWithImpl<_LawCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LawCategoryToJson(this);
  }
}

abstract class _LawCategory implements LawCategory {
  factory _LawCategory({String name, String description, String coverUrl}) =
      _$_LawCategory;

  factory _LawCategory.fromJson(Map<String, dynamic> json) =
      _$_LawCategory.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LawCategoryCopyWith<_LawCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
