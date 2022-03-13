import 'package:google_action_plan/modules/list/domain/entities/response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'function_response.g.dart';

@JsonSerializable(includeIfNull: false)
class FunctionResponse {
  bool? done;
  Response? response;

  FunctionResponse({
    this.done,
    this.response,
  });

  factory FunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$FunctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionResponseToJson(this);
}
