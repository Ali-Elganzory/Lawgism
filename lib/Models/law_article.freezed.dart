// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'law_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LawArticle _$LawArticleFromJson(Map<String, dynamic> json) {
  return _LawArticle.fromJson(json);
}

/// @nodoc
class _$LawArticleTearOff {
  const _$LawArticleTearOff();

  _LawArticle call(
      {String lawArticleId = '',
      String category = '',
      String coverUrl = '',
      String title = '',
      String brief = '',
      List<LawArticleItem> content = const <LawArticleItem>[]}) {
    return _LawArticle(
      lawArticleId: lawArticleId,
      category: category,
      coverUrl: coverUrl,
      title: title,
      brief: brief,
      content: content,
    );
  }

  LawArticle fromJson(Map<String, Object> json) {
    return LawArticle.fromJson(json);
  }
}

/// @nodoc
const $LawArticle = _$LawArticleTearOff();

/// @nodoc
mixin _$LawArticle {
  String get lawArticleId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get coverUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get brief => throw _privateConstructorUsedError;
  List<LawArticleItem> get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LawArticleCopyWith<LawArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawArticleCopyWith<$Res> {
  factory $LawArticleCopyWith(
          LawArticle value, $Res Function(LawArticle) then) =
      _$LawArticleCopyWithImpl<$Res>;
  $Res call(
      {String lawArticleId,
      String category,
      String coverUrl,
      String title,
      String brief,
      List<LawArticleItem> content});
}

/// @nodoc
class _$LawArticleCopyWithImpl<$Res> implements $LawArticleCopyWith<$Res> {
  _$LawArticleCopyWithImpl(this._value, this._then);

  final LawArticle _value;
  // ignore: unused_field
  final $Res Function(LawArticle) _then;

  @override
  $Res call({
    Object? lawArticleId = freezed,
    Object? category = freezed,
    Object? coverUrl = freezed,
    Object? title = freezed,
    Object? brief = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      lawArticleId: lawArticleId == freezed
          ? _value.lawArticleId
          : lawArticleId // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brief: brief == freezed
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<LawArticleItem>,
    ));
  }
}

/// @nodoc
abstract class _$LawArticleCopyWith<$Res> implements $LawArticleCopyWith<$Res> {
  factory _$LawArticleCopyWith(
          _LawArticle value, $Res Function(_LawArticle) then) =
      __$LawArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String lawArticleId,
      String category,
      String coverUrl,
      String title,
      String brief,
      List<LawArticleItem> content});
}

/// @nodoc
class __$LawArticleCopyWithImpl<$Res> extends _$LawArticleCopyWithImpl<$Res>
    implements _$LawArticleCopyWith<$Res> {
  __$LawArticleCopyWithImpl(
      _LawArticle _value, $Res Function(_LawArticle) _then)
      : super(_value, (v) => _then(v as _LawArticle));

  @override
  _LawArticle get _value => super._value as _LawArticle;

  @override
  $Res call({
    Object? lawArticleId = freezed,
    Object? category = freezed,
    Object? coverUrl = freezed,
    Object? title = freezed,
    Object? brief = freezed,
    Object? content = freezed,
  }) {
    return _then(_LawArticle(
      lawArticleId: lawArticleId == freezed
          ? _value.lawArticleId
          : lawArticleId // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brief: brief == freezed
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<LawArticleItem>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LawArticle implements _LawArticle {
  const _$_LawArticle(
      {this.lawArticleId = '',
      this.category = '',
      this.coverUrl = '',
      this.title = '',
      this.brief = '',
      this.content = const <LawArticleItem>[]});

  factory _$_LawArticle.fromJson(Map<String, dynamic> json) =>
      _$_$_LawArticleFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String lawArticleId;
  @JsonKey(defaultValue: '')
  @override
  final String category;
  @JsonKey(defaultValue: '')
  @override
  final String coverUrl;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String brief;
  @JsonKey(defaultValue: const <LawArticleItem>[])
  @override
  final List<LawArticleItem> content;

  @override
  String toString() {
    return 'LawArticle(lawArticleId: $lawArticleId, category: $category, coverUrl: $coverUrl, title: $title, brief: $brief, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LawArticle &&
            (identical(other.lawArticleId, lawArticleId) ||
                const DeepCollectionEquality()
                    .equals(other.lawArticleId, lawArticleId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.coverUrl, coverUrl) ||
                const DeepCollectionEquality()
                    .equals(other.coverUrl, coverUrl)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.brief, brief) ||
                const DeepCollectionEquality().equals(other.brief, brief)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lawArticleId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(coverUrl) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(brief) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$LawArticleCopyWith<_LawArticle> get copyWith =>
      __$LawArticleCopyWithImpl<_LawArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LawArticleToJson(this);
  }
}

abstract class _LawArticle implements LawArticle {
  const factory _LawArticle(
      {String lawArticleId,
      String category,
      String coverUrl,
      String title,
      String brief,
      List<LawArticleItem> content}) = _$_LawArticle;

  factory _LawArticle.fromJson(Map<String, dynamic> json) =
      _$_LawArticle.fromJson;

  @override
  String get lawArticleId => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get coverUrl => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get brief => throw _privateConstructorUsedError;
  @override
  List<LawArticleItem> get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LawArticleCopyWith<_LawArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
