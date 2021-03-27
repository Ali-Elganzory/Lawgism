import 'package:freezed_annotation/freezed_annotation.dart';

part "user.freezed.dart";
part "user.g.dart";

@freezed
class User with _$User {
  factory User({
    @Default("") String name,
    @Default("") String email,
    @Default("") String phone,
    @Default("") String photoUrl,
    @Default("") String address,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
