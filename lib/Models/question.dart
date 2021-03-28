import 'package:freezed_annotation/freezed_annotation.dart';

part "question.freezed.dart";
part "question.g.dart";

@freezed
class Question with _$Question {
  factory Question({
    @Default("") String id,
    @Default("") String questionerId,
    @Default("") String question,
    @Default("") String description,
    @Default("") String url,
    @Default(0) num answerCount,
    DateTime? createdAt,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
