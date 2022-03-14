import 'package:google_action_plan/domain/entities/function_set.dart';
import 'package:google_action_plan/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable(includeIfNull: false)
class File {
  String? name;
  String? type;
  String? source;
  User? lastModifyUser;
  String? createTime;
  String? updateTime;
  FunctionSet? functionSet;

  File({
    this.name,
    this.type,
    this.source,
    this.lastModifyUser,
    this.createTime,
    this.updateTime,
    this.functionSet,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}

var d = r'''
    {
      "name": "appsscript",
      "type": "JSON",
      "source": "{\n  \"timeZone\": \"America/New_York\",\n  \"dependencies\": {},\n  \"exceptionLogging\": \"STACKDRIVER\",\n  \"runtimeVersion\": \"V8\",\n  \"webapp\": {\n    \"executeAs\": \"USER_ACCESSING\",\n    \"access\": \"ANYONE\"\n  },\n  \"executionApi\": {\n    \"access\": \"ANYONE\"\n  }\n}",
      "lastModifyUser": {
        "domain": "gmail.com",
        "email": "jefguns@gmail.com",
        "name": "Natália Furtado",
        "photoUrl": "https://lh3.googleusercontent.com/a-/AOh14GhpIwO56UNlzBaJff0SXUlV0OzPRTsudxg3v-1lEnQ=h128"
      },
      "createTime": "2021-11-24T23:07:31.496Z",
      "updateTime": "2021-11-24T23:15:15.056Z",
      "functionSet": {}
    },
    ''';
