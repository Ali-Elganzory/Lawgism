// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'law_article_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LawArticleItem _$LawArticleItemFromJson(Map<String, dynamic> json) {
  return _LawArticleItem.fromJson(json);
}

/// @nodoc
class _$LawArticleItemTearOff {
  const _$LawArticleItemTearOff();

  _LawArticleItem call(
      {LawArticleItemType type = LawArticleItemType.body,
      String content = ""}) {
    return _LawArticleItem(
      type: type,
      content: content,
    );
  }

  LawArticleItem fromJson(Map<String, Object> json) {
    return LawArticleItem.fromJson(json);
  }
}

/// @nodoc
const $LawArticleItem = _$LawArticleItemTearOff();

/// @nodoc
mixin _$LawArticleItem {
  LawArticleItemType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LawArticleItemCopyWith<LawArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawArticleItemCopyWith<$Res> {
  factory $LawArticleItemCopyWith(
          LawArticleItem value, $Res Function(LawArticleItem) then) =
      _$LawArticleItemCopyWithImpl<$Res>;
  $Res call({LawArticleItemType type, String content});
}

/// @nodoc
class _$LawArticleItemCopyWithImpl<$Res>
    implements $LawArticleItemCopyWith<$Res> {
  _$LawArticleItemCopyWithImpl(this._value, this._then);

  final LawArticleItem _value;
  // ignore: unused_field
  final $Res Function(LawArticleItem) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LawArticleItemType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LawArticleItemCopyWith<$Res>
    implements $LawArticleItemCopyWith<$Res> {
  factory _$LawArticleItemCopyWith(
          _LawArticleItem value, $Res Function(_LawArticleItem) then) =
      __$LawArticleItemCopyWithImpl<$Res>;
  @override
  $Res call({LawArticleItemType type, String content});
}

/// @nodoc
class __$LawArticleItemCopyWithImpl<$Res>
    extends _$LawArticleItemCopyWithImpl<$Res>
    implements _$LawArticleItemCopyWith<$Res> {
  __$LawArticleItemCopyWithImpl(
      _LawArticleItem _value, $Res Function(_LawArticleItem) _then)
      : super(_value, (v) => _then(v as _LawArticleItem));

  @override
  _LawArticleItem get _value => super._value as _LawArticleItem;

  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
  }) {
    return _then(_LawArticleItem(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LawArticleItemType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LawArticleItem implements _LawArticleItem {
  const _$_LawArticleItem(
      {this.type = LawArticleItemType.body, this.content = ""});

  factory _$_LawArticleItem.fromJson(Map<String, dynamic> json) =>
      _$_$_LawArticleItemFromJson(json);

  @JsonKey(defaultValue: LawArticleItemType.body)
  @override
  final LawArticleItemType type;
  @JsonKey(defaultValue: "")
  @override
  final String content;

  @override
  String toString() {
    return 'LawArticleItem(type: $type, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LawArticleItem &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$LawArticleItemCopyWith<_LawArticleItem> get copyWith =>
      __$LawArticleItemCopyWithImpl<_LawArticleItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LawArticleItemToJson(this);
  }
}

abstract class _LawArticleItem implements LawArticleItem {
  const factory _LawArticleItem({LawArticleItemType type, String content}) =
      _$_LawArticleItem;

  factory _LawArticleItem.fromJson(Map<String, dynamic> json) =
      _$_LawArticleItem.fromJson;

  @override
  LawArticleItemType get type => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LawArticleItemCopyWith<_LawArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
