// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$_$_AnswerFromJson(Map<String, dynamic> json) {
  return _$_Answer(
    id: json['id'] as String? ?? '',
    answererId: json['answererId'] as String? ?? '',
    answer: json['answer'] as String? ?? '',
    votes: json['votes'] as int? ?? 0,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$_$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answererId': instance.answererId,
      'answer': instance.answer,
      'votes': instance.votes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
