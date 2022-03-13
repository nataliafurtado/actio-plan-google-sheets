// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionResponse _$FunctionResponseFromJson(Map<String, dynamic> json) =>
    FunctionResponse(
      done: json['done'] as bool?,
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FunctionResponseToJson(FunctionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('done', instance.done);
  writeNotNull('response', instance.response);
  return val;
}
