import 'package:dio/dio.dart';

import 'package:google_action_plan/modules/list/domain/entities/file.dart';
import 'package:google_action_plan/modules/list/domain/entities/function_set.dart';
import 'package:google_action_plan/modules/list/domain/entities/project.dart';
import 'package:google_action_plan/modules/list/domain/entities/user.dart';
import 'package:google_action_plan/modules/list/domain/entities/values.dart';
import 'package:google_action_plan/services/cache/project_cache.dart';

class ListRepository {
  final Dio dio;
  final ProjectCache projectCache;
  ListRepository({
    required this.dio,
    required this.projectCache,
  });

  late Project project;

  Future<void> makeInitialConfig() async {
    await createProject();
    await updateProject();
    await createVersion();
    await createDeplyment();
    projectCache.saveProject(project);
  }

  Future<void> createProject() async {
    try {
      var response = await dio.post(
        'https://script.googleapis.com/v1/projects',
        data: {
          "title": "TestNat58",
        },
      );

      // ignore: avoid_print
      print(response);
      updateProjectProperties(Project.fromJson(response.data));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProject() async {
    try {
      var response = await dio.put(
        'https://script.googleapis.com/v1/projects/${project.scriptId}/content',
        data: project.toJson(),
      );
      // ignore: avoid_print
      print(response);
      // print(updateProject2!.toJson());
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> createVersion() async {
    try {
      var response = await dio.post(
        'https://script.googleapis.com/v1/projects/${project.scriptId}/versions',
        data: {
          "versionNumber": 1,
          "description": "wwwwww",
          "createTime": project.updateTime,
        },
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> createDeplyment() async {
    try {
      var response = await dio.post(
          'https://script.googleapis.com/v1/projects/${project.scriptId}/deployments',
          data: {
            "versionNumber": 1,
            "manifestFileName": "appsscript",
            "description": "dddd"
          });

      project.deploimentId = response.data['deploymentId'];
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // "function": "createInitialConfig",
  // "parameters": ["1P08dd5KYsoGLHyyix-8KR2TkprIwmj5K6LmkInodGSU"],

  Future<void> makeinitialConfig() async {
    await runScript({
      "function": "teste1",
    });
  }

  Future<void> runScript(Map<String, dynamic> data) async {
    try {
      var response = await dio.post(
        'https://script.googleapis.com/v1/scripts/${project.deploimentId}:run',
        data: data,
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProjectProperties(Project projectPassed) async {
    final updateProjectAux = Project(
      scriptId: projectPassed.scriptId,
      files: [
        File(
          name: 'appsscript',
          type: "JSON",
          source:
              "{\n  \"timeZone\": \"America/New_York\",\n  \"dependencies\": {},\n  \"exceptionLogging\": \"STACKDRIVER\",\n  \"runtimeVersion\": \"V8\",\n  \"webapp\": {\n    \"executeAs\": \"USER_ACCESSING\",\n    \"access\": \"ANYONE\"\n  },\n  \"executionApi\": {\n    \"access\": \"ANYONE\"\n  }\n}",
          lastModifyUser: User(
            domain: projectPassed.creator!.domain,
            email: projectPassed.creator!.email,
            name: projectPassed.creator!.name,
            photoUrl: projectPassed.creator!.photoUrl,
          ),
          createTime: projectPassed.updateTime,
          updateTime: projectPassed.updateTime,
          functionSet: FunctionSet(),
        ),
        File(
          name: 'codigo',
          type: "SERVER_JS",
          source:
              "function teste1(request){\n   var returnValue;\n   try{\n    var createdSheet = SpreadsheetApp.create(\"Finances2\");\n    SpreadsheetApp.setActiveSpreadsheet(createdSheet);  \n    returnValue = createdSheet.getId();\n       \n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n\n  return returnValue;\n}\n\nfunction createInitialConfig(id){\n  var result = {\"status\": \"SUCCESS\"};  \n  var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n   if(sheet.getRange(\"A1\").getValue()==\"CRIAÇÂO\"){\n       return result;\n   }\n\n  sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([[\"CRIAÇÂO\", \"CATEGORIA\", \"O QUE ?\", \"COMO ?\",\"QUEM ?\",\"PRAZO\",\"STATUS\",\"FEED BACK\",\"OBS\"]]);\n\n  sheet.appendRow([\"28/12/2020\", \"EMPREGO\", \"Curriculo\", \"Fazer curriculo com ajuda de pedro e com manual do email de pedro\",\"Natália\",\"06/10/2021\",\"EM PROGRESSO\",\"TESTE\",\"TESTE\"]); \n\n  sheet.getRange(\"A1:I1\").setFontWeight(\"bold\").setBackground(\"#4a86e8\").setFontColor(\"#ffffff\").setHorizontalAlignment(\"center\");\n  sheet.setColumnWidth(4,320);\n  // sheet.setColumnWidth(5,50);\n  sheet.setColumnWidth(7,120);\n\n  sheet.getRange(\"A1:I100\").setBorder(true, true, true, true, true, true).setVerticalAlignment(\"middle\");\n  sheet.getRange(\"A:A\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"B:B\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"C:C\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"E:E\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"F:F\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"G:G\").setHorizontalAlignment(\"center\");\n\n  sheet.setRowHeights(1, 100, 40);\n\n  var rule = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM PROGRESSO\")\n    .setBackground(\"#ffff00\") \n    .setBold(true)\n    .setFontColor(\"#434343\")   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule1 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"ATRASADA\")\n    .setBackground(\"#fb1744\")   \n    .setBold(true)\n    .setFontColor(\"#ffffff\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n  var rule2 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"CANCELADA\")\n    .setBackground(\"#efefef\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule3 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"COMPLETA\")\n    .setBackground(\"#69f0ae\")\n    .setBold(true)\n    .setFontColor(\"#666666\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule4 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM ESPERA\")\n    .setBackground(\"#d9d9d9\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n\n  var rule5 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#69f0ae\")\n    .setBold(true)   \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();\n\n  var rule6 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#fb1744\")\n    .setBold(true)\n    .setFontColor(\"#ffffff\")    \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build(); \n\n  var rule7 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#ffff00\")\n    .setBold(true)       \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();    \n\n  var rules = sheet.getConditionalFormatRules();\n    rules.push(rule);\n    rules.push(rule1);\n    rules.push(rule2);\n    rules.push(rule3);\n    rules.push(rule4);\n    rules.push(rule5);\n    rules.push(rule6);\n    rules.push(rule7);\n\n  sheet.setConditionalFormatRules(rules);\n\n\n  return result;\n}\n\n\n\n",
          lastModifyUser: User(
            domain: projectPassed.creator!.domain,
            email: projectPassed.creator!.email,
            name: projectPassed.creator!.name,
            photoUrl: projectPassed.creator!.photoUrl,
          ),
          createTime: projectPassed.updateTime,
          updateTime: projectPassed.updateTime,
          functionSet: FunctionSet(
            values: [
              Values("doPost"),
              Values("doGet"),
            ],
          ),
        ),
      ],
    );
    project = updateProjectAux;
  }
}

//  "function": "createInitialConfig",
// "parameters": ["1G8F0hAOVIB66E84d-2KiRUInWHmLGZaw5t9QZZDDMps"],

const updateProjectJson = r'''
{
  "files": [
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
    {
      "name": "codigo",
      "type": "SERVER_JS",
      "source": "function teste1(request){\n   var returnValue;\n   try{\n    var createdSheet = SpreadsheetApp.create(\"Finances2\");\n    SpreadsheetApp.setActiveSpreadsheet(createdSheet);  \n    returnValue = createdSheet.getId();\n       \n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n\n  return returnValue;\n}\n\nfunction createInitialConfig(id){\n  var result = {\"status\": \"SUCCESS\"};  \n  var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n   if(sheet.getRange(\"A1\").getValue()==\"CRIAÇÂO\"){\n       return result;\n   }\n\n  sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([[\"CRIAÇÂO\", \"CATEGORIA\", \"O QUE ?\", \"COMO ?\",\"QUEM ?\",\"PRAZO\",\"STATUS\",\"FEED BACK\",\"OBS\"]]);\n\n  sheet.appendRow([\"28/12/2020\", \"EMPREGO\", \"Curriculo\", \"Fazer curriculo com ajuda de pedro e com manual do email de pedro\",\"Natália\",\"06/10/2021\",\"EM PROGRESSO\",\"TESTE\",\"TESTE\"]); \n\n  sheet.getRange(\"A1:I1\").setFontWeight(\"bold\").setBackground(\"#4a86e8\").setFontColor(\"#ffffff\").setHorizontalAlignment(\"center\");\n  sheet.setColumnWidth(4,320);\n  // sheet.setColumnWidth(5,50);\n  sheet.setColumnWidth(7,120);\n\n  sheet.getRange(\"A1:I100\").setBorder(true, true, true, true, true, true).setVerticalAlignment(\"middle\");\n  sheet.getRange(\"A:A\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"B:B\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"C:C\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"E:E\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"F:F\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"G:G\").setHorizontalAlignment(\"center\");\n\n  sheet.setRowHeights(1, 100, 40);\n\n  var rule = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM PROGRESSO\")\n    .setBackground(\"#ffff00\") \n    .setBold(true)\n    .setFontColor(\"#434343\")   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule1 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"ATRASADA\")\n    .setBackground(\"#fb1744\")   \n    .setBold(true)\n    .setFontColor(\"#ffffff\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n  var rule2 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"CANCELADA\")\n    .setBackground(\"#efefef\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule3 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"COMPLETA\")\n    .setBackground(\"#69f0ae\")\n    .setBold(true)\n    .setFontColor(\"#666666\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule4 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM ESPERA\")\n    .setBackground(\"#d9d9d9\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n\n  var rule5 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#69f0ae\")\n    .setBold(true)   \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();\n\n  var rule6 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#fb1744\")\n    .setBold(true)\n    .setFontColor(\"#ffffff\")    \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build(); \n\n  var rule7 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#ffff00\")\n    .setBold(true)       \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();    \n\n  var rules = sheet.getConditionalFormatRules();\n    rules.push(rule);\n    rules.push(rule1);\n    rules.push(rule2);\n    rules.push(rule3);\n    rules.push(rule4);\n    rules.push(rule5);\n    rules.push(rule6);\n    rules.push(rule7);\n\n  sheet.setConditionalFormatRules(rules);\n\n\n  return result;\n}\n\n\n\n",
      "lastModifyUser": {
        "domain": "gmail.com",
        "email": "jefguns@gmail.com",
        "name": "Natália Furtado",
        "photoUrl": "https://lh3.googleusercontent.com/a-/AOh14GhpIwO56UNlzBaJff0SXUlV0OzPRTsudxg3v-1lEnQ=h128"
      },
      "createTime": "2021-11-24T23:07:32.233Z",
      "updateTime": "2021-11-24T23:15:15.056Z",
      "functionSet": {
        "values": [
          {
            "name": "doPost"
          },
          {
            "name": "doGet"
          }
        ]
      }
    }
  ],
  "scriptId": "1f4cNQqdVMbUSTAAKWZ3NzmtnClJkhsEuTDyD-_dwhSNPPKlX5fF_Fcs1"
}
''';
