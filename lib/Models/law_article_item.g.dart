// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'law_article_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LawArticleItem _$_$_LawArticleItemFromJson(Map<String, dynamic> json) {
  return _$_LawArticleItem(
    type: _$enumDecodeNullable(_$LawArticleItemTypeEnumMap, json['type']) ??
        LawArticleItemType.body,
    content: json['content'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_LawArticleItemToJson(_$_LawArticleItem instance) =>
    <String, dynamic>{
      'type': _$LawArticleItemTypeEnumMap[instance.type],
      'content': instance.content,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$LawArticleItemTypeEnumMap = {
  LawArticleItemType.image: 'image',
  LawArticleItemType.headline1: 'headline1',
  LawArticleItemType.headline2: 'headline2',
  LawArticleItemType.body: 'body',
};
