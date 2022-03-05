import 'package:google_action_plan/modules/list/domain/entities/file.dart';
import 'package:google_action_plan/modules/list/domain/entities/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(includeIfNull: false)
class Project {
  String? scriptId;

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
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
