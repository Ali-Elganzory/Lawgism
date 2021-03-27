import 'package:freezed_annotation/freezed_annotation.dart';

part 'law_article_item.freezed.dart';
part 'law_article_item.g.dart';

enum LawArticleItemType { image, headline1, headline2, body }

@freezed
abstract class LawArticleItem with _$LawArticleItem {
  const factory LawArticleItem({
    @Default(LawArticleItemType.body) LawArticleItemType type,
    @Default("") String content,
  }) = _LawArticleItem;

  factory LawArticleItem.fromJson(Map<String, dynamic> json) =>
      _$LawArticleItemFromJson(json);
}
