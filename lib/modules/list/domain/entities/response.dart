import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(includeIfNull: false)
class Response {
  String? result;

  Response({
    this.result,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
