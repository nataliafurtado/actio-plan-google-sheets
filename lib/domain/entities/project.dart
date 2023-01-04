import 'package:google_action_plan/domain/entities/file.dart';
import 'package:google_action_plan/domain/entities/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(includeIfNull: false)
class Project {
  String? scriptId;
  String? deploimentId;
  String? sheetId;

  String? title;
  String? updateTime;
  List<File>? files;
  User? creator;
  User? lastModifyUser;

  Project({
    this.scriptId,
    this.files,
    this.creator,
    this.lastModifyUser,
    this.deploimentId,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
