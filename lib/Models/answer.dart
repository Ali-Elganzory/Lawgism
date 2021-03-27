import 'package:freezed_annotation/freezed_annotation.dart';

part "answer.freezed.dart";
part "answer.g.dart";

@freezed
class Answer with _$Answer {
  factory Answer({
    @Default("") String answererId,
    @Default("") String answer,
    @Default(0) int votes,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);
}
