// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
class _$QuestionTearOff {
  const _$QuestionTearOff();

  _Question call(
      {String id = "",
      String questionerId = "",
      String question = "",
      String description = "",
      String url = "",
      num answerCount = 0,
      DateTime? createdAt}) {
    return _Question(
      id: id,
      questionerId: questionerId,
      question: question,
      description: description,
      url: url,
      answerCount: answerCount,
      createdAt: createdAt,
    );
  }

  Question fromJson(Map<String, Object> json) {
    return Question.fromJson(json);
  }
}

/// @nodoc
const $Question = _$QuestionTearOff();

/// @nodoc
mixin _$Question {
  String get id => throw _privateConstructorUsedError;
  String get questionerId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  num get answerCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String questionerId,
      String question,
      String description,
      String url,
      num answerCount,
      DateTime? createdAt});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionerId = freezed,
    Object? question = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? answerCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionerId: questionerId == freezed
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String questionerId,
      String question,
      String description,
      String url,
      num answerCount,
      DateTime? createdAt});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object? id = freezed,
    Object? questionerId = freezed,
    Object? question = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? answerCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Question(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionerId: questionerId == freezed
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Question implements _Question {
  _$_Question(
      {this.id = "",
      this.questionerId = "",
      this.question = "",
      this.description = "",
      this.url = "",
      this.answerCount = 0,
      this.createdAt});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @JsonKey(defaultValue: "")
  @override
  final String questionerId;
  @JsonKey(defaultValue: "")
  @override
  final String question;
  @JsonKey(defaultValue: "")
  @override
  final String description;
  @JsonKey(defaultValue: "")
  @override
  final String url;
  @JsonKey(defaultValue: 0)
  @override
  final num answerCount;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Question(id: $id, questionerId: $questionerId, question: $question, description: $description, url: $url, answerCount: $answerCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionerId, questionerId) ||
                const DeepCollectionEquality()
                    .equals(other.questionerId, questionerId)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.answerCount, answerCount) ||
                const DeepCollectionEquality()
                    .equals(other.answerCount, answerCount)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionerId) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(answerCount) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  factory _Question(
      {String id,
      String questionerId,
      String question,
      String description,
      String url,
      num answerCount,
      DateTime? createdAt}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get questionerId => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  num get answerCount => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionCopyWith<_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
