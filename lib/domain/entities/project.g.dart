// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      scriptId: json['scriptId'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      lastModifyUser: json['lastModifyUser'] == null
          ? null
          : User.fromJson(json['lastModifyUser'] as Map<String, dynamic>),
      deploimentId: json['deploimentId'] as String?,
    )
      ..title = json['title'] as String?
      ..updateTime = json['updateTime'] as String?;

Map<String, dynamic> _$ProjectToJson(Project instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scriptId', instance.scriptId);
  writeNotNull('deploimentId', instance.deploimentId);
  writeNotNull('title', instance.title);
  writeNotNull('updateTime', instance.updateTime);
  writeNotNull('files', instance.files);
  writeNotNull('creator', instance.creator);
  writeNotNull('lastModifyUser', instance.lastModifyUser);
  return val;
}
