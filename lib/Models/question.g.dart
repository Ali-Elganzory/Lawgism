// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    id: json['id'] as String? ?? '',
    questionerId: json['questionerId'] as String? ?? '',
    question: json['question'] as String? ?? '',
    description: json['description'] as String? ?? '',
    url: json['url'] as String? ?? '',
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionerId': instance.questionerId,
      'question': instance.question,
      'description': instance.description,
      'url': instance.url,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
