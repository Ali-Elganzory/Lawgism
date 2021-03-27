// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'law_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LawArticle _$_$_LawArticleFromJson(Map<String, dynamic> json) {
  return _$_LawArticle(
    lawArticleId: json['lawArticleId'] as String? ?? '',
    category: json['category'] as String? ?? '',
    coverUrl: json['coverUrl'] as String? ?? '',
    title: json['title'] as String? ?? '',
    brief: json['brief'] as String? ?? '',
    content: json['content'] as List<LawArticleItem>? ?? [],
  );
}

Map<String, dynamic> _$_$_LawArticleToJson(_$_LawArticle instance) =>
    <String, dynamic>{
      'lawArticleId': instance.lawArticleId,
      'category': instance.category,
      'coverUrl': instance.coverUrl,
      'title': instance.title,
      'brief': instance.brief,
      'content': instance.content.map((e) => e.toJson()).toList(),
    };
