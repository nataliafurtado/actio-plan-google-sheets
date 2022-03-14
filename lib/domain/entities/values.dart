import 'package:json_annotation/json_annotation.dart';

part 'values.g.dart';

@JsonSerializable()
class Values {
  String? name;

  Values(
    this.name,
  );

  factory Values.fromJson(Map<String, dynamic> json) => _$ValuesFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesToJson(this);
}
