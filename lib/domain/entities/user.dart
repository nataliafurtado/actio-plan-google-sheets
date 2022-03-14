import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  String domain;
  String email;
  String name;
  String photoUrl;
  String? type;

  User({
    required this.domain,
    required this.email,
    required this.name,
    required this.photoUrl,
    this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
