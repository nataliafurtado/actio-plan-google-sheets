// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionSet _$FunctionSetFromJson(Map<String, dynamic> json) => FunctionSet(
      values: (json['values'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Values.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FunctionSetToJson(FunctionSet instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
