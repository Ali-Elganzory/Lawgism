import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lawgism/Models/law_article_item.dart';

part 'law_article.freezed.dart';
part 'law_article.g.dart';

@freezed
abstract class LawArticle with _$LawArticle {
  const factory LawArticle({
    @Default('') String lawArticleId,
    @Default('') String category,
    @Default('') String coverUrl,
    @Default('') String title,
    @Default('') String brief,
    @Default(<LawArticleItem>[]) List<LawArticleItem> content,
  }) = _LawArticle;

  factory LawArticle.fromJson(Map<String, dynamic> json) =>
      _$LawArticleFromJson(json);
}
