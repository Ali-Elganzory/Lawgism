import 'package:freezed_annotation/freezed_annotation.dart';

part "law_category.freezed.dart";
part "law_category.g.dart";

@freezed
class LawCategory with _$LawCategory {
  factory LawCategory({
    @Default("") String name,
    @Default("") String description,
    @Default("") String coverUrl,
  }) = _LawCategory;

  factory LawCategory.fromJson(Map<String, dynamic> json) =>
      _$LawCategoryFromJson(json);
}
