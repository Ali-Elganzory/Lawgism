// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
class _$AnswerTearOff {
  const _$AnswerTearOff();

  _Answer call(
      {String id = "",
      String answererId = "",
      String answer = "",
      int votes = 0,
      DateTime? createdAt}) {
    return _Answer(
      id: id,
      answererId: answererId,
      answer: answer,
      votes: votes,
      createdAt: createdAt,
    );
  }

  Answer fromJson(Map<String, Object> json) {
    return Answer.fromJson(json);
  }
}

/// @nodoc
const $Answer = _$AnswerTearOff();

/// @nodoc
mixin _$Answer {
  String get id => throw _privateConstructorUsedError;
  String get answererId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  int get votes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String answererId,
      String answer,
      int votes,
      DateTime? createdAt});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? answererId = freezed,
    Object? answer = freezed,
    Object? votes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answererId: answererId == freezed
          ? _value.answererId
          : answererId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      votes: votes == freezed
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$AnswerCopyWith(_Answer value, $Res Function(_Answer) then) =
      __$AnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String answererId,
      String answer,
      int votes,
      DateTime? createdAt});
}

/// @nodoc
class __$AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$AnswerCopyWith<$Res> {
  __$AnswerCopyWithImpl(_Answer _value, $Res Function(_Answer) _then)
      : super(_value, (v) => _then(v as _Answer));

  @override
  _Answer get _value => super._value as _Answer;

  @override
  $Res call({
    Object? id = freezed,
    Object? answererId = freezed,
    Object? answer = freezed,
    Object? votes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Answer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answererId: answererId == freezed
          ? _value.answererId
          : answererId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      votes: votes == freezed
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Answer implements _Answer {
  _$_Answer(
      {this.id = "",
      this.answererId = "",
      this.answer = "",
      this.votes = 0,
      this.createdAt});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$_$_AnswerFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @JsonKey(defaultValue: "")
  @override
  final String answererId;
  @JsonKey(defaultValue: "")
  @override
  final String answer;
  @JsonKey(defaultValue: 0)
  @override
  final int votes;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Answer(id: $id, answererId: $answererId, answer: $answer, votes: $votes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Answer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.answererId, answererId) ||
                const DeepCollectionEquality()
                    .equals(other.answererId, answererId)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.votes, votes) ||
                const DeepCollectionEquality().equals(other.votes, votes)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(answererId) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(votes) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$AnswerCopyWith<_Answer> get copyWith =>
      __$AnswerCopyWithImpl<_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnswerToJson(this);
  }
}

abstract class _Answer implements Answer {
  factory _Answer(
      {String id,
      String answererId,
      String answer,
      int votes,
      DateTime? createdAt}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get answererId => throw _privateConstructorUsedError;
  @override
  String get answer => throw _privateConstructorUsedError;
  @override
  int get votes => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnswerCopyWith<_Answer> get copyWith => throw _privateConstructorUsedError;
}
