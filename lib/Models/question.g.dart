// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    questionerId: json['questionerId'] as String? ?? '',
    question: json['question'] as String? ?? '',
    description: json['description'] as String? ?? '',
    url: json['url'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'questionerId': instance.questionerId,
      'question': instance.question,
      'description': instance.description,
      'url': instance.url,
    };
