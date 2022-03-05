// import 'dart:convert' as convert;
//
// import 'package:get_it/get_it.dart';
// import 'package:google_action_plan/id_sheet_singleton.dart';

import 'package:dio/dio.dart';

import 'package:google_action_plan/assets/constants.dart';
import 'package:google_action_plan/models/action.dart';
import 'package:google_action_plan/modules/list/domain/entities/file.dart';
import 'package:google_action_plan/modules/list/domain/entities/function_set.dart';
import 'package:google_action_plan/modules/list/domain/entities/project.dart';
import 'package:google_action_plan/modules/list/domain/entities/user.dart';
import 'package:google_action_plan/modules/list/domain/entities/values.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';
import 'package:google_action_plan/services/cache/project_cache.dart';

class ListRepository {
  final LoginController loginController;
  final Dio dio;
  final ProjectCache projectCache;
  ListRepository({
    required this.loginController,
    required this.dio,
    required this.projectCache,
  });

  String? sid;

  String? depId;

  String httprequest =
      "https://script.google.com/home/projects/AKfycbwvUKI-SGwg47YFlBBLCkW85sdDtOGmc4MenUlVGUR3DAeed_GGwa8-nA2qvXitZrffmA/settings";

  Project? project;
  Project? updateProject2;

  Future<void> makeInitialConfig() async {
    await createProject();
    await updateProject();
    await createVersion();
    await createDeplyment();
  }

  Future<void> doGet() async {
    try {
      var response = await dio.get(httprequest);

      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    // String? url = GetIt.I.get<IdSheetSingleton>().controllerIdSheet;

    // List<ActionEvent> newList = [];
    // var response = await http.get(url);
    // if (response.statusCode == 200 && response.body.isNotEmpty) {
    //   List<dynamic> j = convert.jsonDecode(response.body);
    //   for (var i = 0; i < j.length; i++) {
    //     newList.add(ActionEvent.fromJson(j[i], i));
    //   }
    // } else if (response.statusCode == 200) {
    // } else {
    //   print("Dialog ocorreu um erro");
    //   showCustomDialog(DialogTeste(
    //     teste: "Ups! Algo deu errado",
    //   ));
    // }
    // return newList;
  }

  Future<void> doPost() async {
    try {
      var d = ActionEvent(
        action: Constants.config,
      );
      var response = await dio.post(
        httprequest,
        data: d.toJson(),
      );

      if (response.statusCode == 200 && response.statusCode == 302) {
      } else {
        // showCustomDialog(DialogTeste(
        //   teste: "Ups! Algo deu errado",
        // ));

      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // int e = ;
  Future<void> createProject() async {
    try {
      var response = await dio.post(
        'https://script.googleapis.com/v1/projects',
        data: {
          "title": "TestNat56",
          // "parentId": "1KY-OMU4PBKYySRd5-48lGmFziWTw8_XxQZN45sZults"
        },
      );
      sid = response.data['scriptId'];
      // ignore: avoid_print
      print(response);
      project = Project.fromJson(response.data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getProjectContent() async {
    try {
      var response = await dio.get(
        'https://script.googleapis.com/v1/projects/1ULrEBtYaoadBXTYl8wL8gS8mCLtYuXiiW5dofFG0jIazq1BaroslPFg2/content',
        // 'https://script.googleapis.com/v1/projects/1TF1qWH6Fj4TRlgi4F-Z3hxhdYc5OGHCsuCtVtK2QYJQrTWsIEtDbCp-5/content',
      );

      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> listProcesses() async {
    try {
      var response = await dio.get(
        'https://script.googleapis.com/v1/processes',
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProject() async {
    try {
      await updateProjectProp();
      var response = await dio.put(
        'https://script.googleapis.com/v1/projects/$sid/content',
        data: updateProject2!.toJson(),
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
        'https://script.googleapis.com/v1/projects/$sid/versions',
        data: {
          "versionNumber": 1,
          "description": "wwwwww",
          "createTime": project!.updateTime,
        },
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> listVersion() async {
    try {
      var response = await dio.get(
        'https://script.googleapis.com/v1/projects/$sid/versions',
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
          'https://script.googleapis.com/v1/projects/$sid/deployments',
          data: {
            "versionNumber": 1,
            "manifestFileName": "appsscript",
            "description": "dddd"
          });

      depId = response.data['deploymentId'];
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getDeploy() async {
    try {
      var response = await dio.get(
        'https://script.googleapis.com/v1/projects/$sid/deployments/$depId',
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // "function": "createInitialConfig",
  // "parameters": ["1P08dd5KYsoGLHyyix-8KR2TkprIwmj5K6LmkInodGSU"],

  Future<void> runScript() async {
    try {
      var response = await dio
          .post('https://script.googleapis.com/v1/scripts/$depId:run', data: {
        "function": "teste1",
      });
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProjectProp() async {
    updateProject2 = Project(
      scriptId: project!.scriptId,
      files: [
        File(
          name: 'appsscript',
          type: "JSON",
          source:
              "{\n  \"timeZone\": \"America/New_York\",\n  \"dependencies\": {},\n  \"exceptionLogging\": \"STACKDRIVER\",\n  \"runtimeVersion\": \"V8\",\n  \"webapp\": {\n    \"executeAs\": \"USER_ACCESSING\",\n    \"access\": \"ANYONE\"\n  },\n  \"executionApi\": {\n    \"access\": \"ANYONE\"\n  }\n}",
          lastModifyUser: User(
            domain: project!.creator!.domain,
            email: project!.creator!.email,
            name: project!.creator!.name,
            photoUrl: project!.creator!.photoUrl,
          ),
          createTime: project!.updateTime,
          updateTime: project!.updateTime,
          functionSet: FunctionSet(),
        ),
        File(
          name: 'codigo',
          type: "SERVER_JS",
          source:
              "function teste1(request){\n   var returnValue;\n   try{\n    var createdSheet = SpreadsheetApp.create(\"Finances2\");\n    SpreadsheetApp.setActiveSpreadsheet(createdSheet);  \n    returnValue = createdSheet.getId();\n       \n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n\n  return returnValue;\n}\n\nfunction createInitialConfig(id){\n  var result = {\"status\": \"SUCCESS\"};  \n  var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n   if(sheet.getRange(\"A1\").getValue()==\"CRIAÇÂO\"){\n       return result;\n   }\n\n  sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([[\"CRIAÇÂO\", \"CATEGORIA\", \"O QUE ?\", \"COMO ?\",\"QUEM ?\",\"PRAZO\",\"STATUS\",\"FEED BACK\",\"OBS\"]]);\n\n  sheet.appendRow([\"28/12/2020\", \"EMPREGO\", \"Curriculo\", \"Fazer curriculo com ajuda de pedro e com manual do email de pedro\",\"Natália\",\"06/10/2021\",\"EM PROGRESSO\",\"TESTE\",\"TESTE\"]); \n\n  sheet.getRange(\"A1:I1\").setFontWeight(\"bold\").setBackground(\"#4a86e8\").setFontColor(\"#ffffff\").setHorizontalAlignment(\"center\");\n  sheet.setColumnWidth(4,320);\n  // sheet.setColumnWidth(5,50);\n  sheet.setColumnWidth(7,120);\n\n  sheet.getRange(\"A1:I100\").setBorder(true, true, true, true, true, true).setVerticalAlignment(\"middle\");\n  sheet.getRange(\"A:A\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"B:B\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"C:C\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"E:E\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"F:F\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"G:G\").setHorizontalAlignment(\"center\");\n\n  sheet.setRowHeights(1, 100, 40);\n\n  var rule = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM PROGRESSO\")\n    .setBackground(\"#ffff00\") \n    .setBold(true)\n    .setFontColor(\"#434343\")   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule1 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"ATRASADA\")\n    .setBackground(\"#fb1744\")   \n    .setBold(true)\n    .setFontColor(\"#ffffff\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n  var rule2 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"CANCELADA\")\n    .setBackground(\"#efefef\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule3 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"COMPLETA\")\n    .setBackground(\"#69f0ae\")\n    .setBold(true)\n    .setFontColor(\"#666666\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule4 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM ESPERA\")\n    .setBackground(\"#d9d9d9\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n\n  var rule5 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#69f0ae\")\n    .setBold(true)   \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();\n\n  var rule6 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#fb1744\")\n    .setBold(true)\n    .setFontColor(\"#ffffff\")    \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build(); \n\n  var rule7 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#ffff00\")\n    .setBold(true)       \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();    \n\n  var rules = sheet.getConditionalFormatRules();\n    rules.push(rule);\n    rules.push(rule1);\n    rules.push(rule2);\n    rules.push(rule3);\n    rules.push(rule4);\n    rules.push(rule5);\n    rules.push(rule6);\n    rules.push(rule7);\n\n  sheet.setConditionalFormatRules(rules);\n\n\n  return result;\n}\n\n\n\n",
          lastModifyUser: User(
            domain: project!.creator!.domain,
            email: project!.creator!.email,
            name: project!.creator!.name,
            photoUrl: project!.creator!.photoUrl,
          ),
          createTime: project!.updateTime,
          updateTime: project!.updateTime,
          functionSet: FunctionSet(
            values: [
              Values("doPost"),
              Values("doGet"),
            ],
          ),
        ),
      ],
    );
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
