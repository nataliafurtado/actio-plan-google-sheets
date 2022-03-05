import 'package:google_action_plan/modules/list/domain/entities/values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'function_set.g.dart';

@JsonSerializable()
class FunctionSet {
  List<Values?>? values;
  FunctionSet({
    this.values,
  });

  factory FunctionSet.fromJson(Map<String, dynamic> json) =>
      _$FunctionSetFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionSetToJson(this);
}
