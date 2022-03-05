// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File(
      name: json['name'] as String?,
      type: json['type'] as String?,
      source: json['source'] as String?,
      lastModifyUser: json['lastModifyUser'] == null
          ? null
          : User.fromJson(json['lastModifyUser'] as Map<String, dynamic>),
      createTime: json['createTime'] as String?,
      updateTime: json['updateTime'] as String?,
      functionSet: json['functionSet'] == null
          ? null
          : FunctionSet.fromJson(json['functionSet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('source', instance.source);
  writeNotNull('lastModifyUser', instance.lastModifyUser);
  writeNotNull('createTime', instance.createTime);
  writeNotNull('updateTime', instance.updateTime);
  writeNotNull('functionSet', instance.functionSet);
  return val;
}
