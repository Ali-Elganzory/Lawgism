// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$_$_AnswerFromJson(Map<String, dynamic> json) {
  return _$_Answer(
    answererId: json['answererId'] as String? ?? '',
    answer: json['answer'] as String? ?? '',
    votes: json['votes'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'answererId': instance.answererId,
      'answer': instance.answer,
      'votes': instance.votes,
    };
