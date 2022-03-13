import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_action_plan/models/action.dart';

import 'package:google_action_plan/modules/list/domain/entities/file.dart';
import 'package:google_action_plan/modules/list/domain/entities/function_response.dart';
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
  late String sheetId;

  Future<void> makeInitialConfig() async {
    await createProject();
    await updateProject();
    await createVersion();
    await createDeplyment();
    projectCache.saveProject(project);
  }

  Future<void> seloadCachedParameters() async {
    project = projectCache.getProject();
    sheetId = projectCache.getSheetId();
  }

  Future<void> createProject() async {
    try {
      var response = await dio.post(
        'https://script.googleapis.com/v1/projects',
        data: {
          "title": "TestNat66",
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

  Future<void> getProjectContent() async {
    try {
      var response = await dio.get(
        'https://script.googleapis.com/v1/projects/${project.scriptId}/content',
      );
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> runScripts() async {
    dynamic dataFromGetId = await runScript(
      {
        "function": "getSheetId",
      },
    );
    final functionGetSheetId = FunctionResponse.fromJson(dataFromGetId);
    projectCache.saveSheetId(functionGetSheetId.response!.result!);
    sheetId = functionGetSheetId.response!.result!;

    // ignore: unused_local_variable
    final functionCreateInitialCOnfig = await runScript(
      {
        "function": "createInitialConfig",
        "parameters": [sheetId],
      },
    );
  }

  Future<List<ActionEvent>> loadRows() async {
    List<ActionEvent> newList = [];
    final functionGetSheet = await runScript(
      {
        "function": "getSheet",
        "parameters": [sheetId],
        "devMode": true
      },
    );
    final functionGetSheetId = FunctionResponse.fromJson(functionGetSheet);
    functionGetSheetId.response!.result!;
    List<dynamic> j = json.decode(functionGetSheetId.response!.result!);
    for (var i = 0; i < j.length; i++) {
      newList.add(ActionEvent.fromJson(j[i], i));
    }
    separetaResponsableValues(newList);
    separetaCategories(newList);
    return newList;
  }

  separetaResponsableValues(List<ActionEvent> list) {
    List<String> responsablesList = [];
    for (var i = 0; i < list.length; i++) {
      responsablesList.add(list[i].quem!);
    }
    responsablesList = responsablesList.toSet().toList();
    // if (!responsablesList.contains("")) {
    //   responsablesList.add("");
    // }
    projectCache.saveResponsablesList(responsablesList);
  }

  List<String> getResResponsablesList() {
    return projectCache.getResponsablesList();
  }

  separetaCategories(List<ActionEvent> list) {
    List<String> categories = [];
    for (var i = 0; i < list.length; i++) {
      categories.add(list[i].categoria!);
    }
    categories = categories.toSet().toList();
    // if (!categories.contains("")) {
    //   categories.add("");
    // }
    projectCache.saveCategories(categories);
  }

  List<String> getCategories() {
    return projectCache.getCategories();
  }

  Future<void> saveActionEvent(ActionEvent actionEvent) async {
    final functionGetSheet = await runScript(
      {
        "function": "save",
        "parameters": [
          actionEvent.data,
          actionEvent.categoria,
          actionEvent.oQue,
          actionEvent.como,
          actionEvent.quem,
          actionEvent.prazo,
          actionEvent.status,
          actionEvent.feedBack,
          actionEvent.obs,
          sheetId,
        ],
        "devMode": true
      },
    );
    final functionGetSheetId = FunctionResponse.fromJson(functionGetSheet);
    // ignore: avoid_print
    print(functionGetSheetId.response!.result!);
  }

  dynamic runScript(Map<String, dynamic> data) async {
    try {
      var response = await dio.post(
        // 'https://script.googleapis.com/v1/scripts/${project.deploimentId}:run',
        'https://script.googleapis.com/v1/scripts/1qIj0K3sV1OIEKRZwqZHyomj2OzAxpne3hOaQkMurRCTWM7ApepsH2xP_:run',
        data: data,
      );
      // ignore: avoid_print
      print(response);
      return response.data;
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
              "function getSheetId(id){   \n   var sheet;\n   var app = SpreadsheetApp;\n   try{ \n     if(id != null){\n      var sheet = app.openById(id);     \n     }    \n      if(sheet==null){\n      sheet = app.create(\"Plano de Ação\");\n      app.setActiveSpreadsheet(sheet); \n      \n    } \n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n  console.log(sheet.getId());  \n  return sheet.getId();\n}\n\nfunction getSheet(id){\n  try{\n  var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n  var lastRow = sheet.getLastRow();\n  var lastColum = sheet.getLastColumn();\n  var originalData = sheet.getRange(2,1,lastRow-1,lastColum).getValues();\n\n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n  var JSONString = JSON.stringify(originalData);\n  var JSONOutput = ContentService.createTextOutput(JSONString);\n  JSONOutput.setMimeType(ContentService.MimeType.JSON);\n  return JSONOutput\n}\n\nfunction createInitialConfig(id){\n  var result =\"SUCCESS\";  \n  var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n   if(sheet.getRange(\"A1\").getValue()==\"CRIAÇÂO\"){\n       return result;\n   }\n\n  sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([[\"CRIAÇÂO\", \"CATEGORIA\", \"O QUE ?\", \"COMO ?\",\"QUEM ?\",\"PRAZO\",\"STATUS\",\"FEED BACK\",\"OBS\"]]);\n\n  sheet.appendRow([\"28/12/2020\", \"EMPREGO\", \"Curriculo\", \"Fazer curriculo com ajuda de pedro e com manual do email de pedro\",\"Natália\",\"06/10/2021\",\"EM PROGRESSO\",\"TESTE\",\"TESTE\"]); \n\n  sheet.getRange(\"A1:I1\").setFontWeight(\"bold\").setBackground(\"#4a86e8\").setFontColor(\"#ffffff\").setHorizontalAlignment(\"center\");\n  sheet.setColumnWidth(4,320);\n  // sheet.setColumnWidth(5,50);\n  sheet.setColumnWidth(7,120);\n\n  sheet.getRange(\"A1:I100\").setBorder(true, true, true, true, true, true).setVerticalAlignment(\"middle\");\n  sheet.getRange(\"A:A\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"B:B\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"C:C\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"E:E\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"F:F\").setHorizontalAlignment(\"center\");\n  sheet.getRange(\"G:G\").setHorizontalAlignment(\"center\");\n\n  sheet.setRowHeights(1, 100, 40);\n\n  var rule = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM PROGRESSO\")\n    .setBackground(\"#ffff00\") \n    .setBold(true)\n    .setFontColor(\"#434343\")   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule1 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"ATRASADA\")\n    .setBackground(\"#fb1744\")   \n    .setBold(true)\n    .setFontColor(\"#ffffff\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n  var rule2 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"CANCELADA\")\n    .setBackground(\"#efefef\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule3 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"COMPLETA\")\n    .setBackground(\"#69f0ae\")\n    .setBold(true)\n    .setFontColor(\"#666666\")  \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n  var rule4 = SpreadsheetApp.newConditionalFormatRule()\n    .whenTextContains(\"EM ESPERA\")\n    .setBackground(\"#d9d9d9\") \n    .setBold(true)   \n    .setRanges([sheet.getRange(\"G:G\")])\n    .build();\n\n\n  var rule5 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#69f0ae\")\n    .setBold(true)   \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();\n\n  var rule6 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#fb1744\")\n    .setBold(true)\n    .setFontColor(\"#ffffff\")    \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build(); \n\n  var rule7 = SpreadsheetApp.newConditionalFormatRule()\n    .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)\n    .setBackground(\"#ffff00\")\n    .setBold(true)       \n    .setRanges([sheet.getRange(\"F:F\")])\n    .build();    \n\n  var rules = sheet.getConditionalFormatRules();\n    rules.push(rule);\n    rules.push(rule1);\n    rules.push(rule2);\n    rules.push(rule3);\n    rules.push(rule4);\n    rules.push(rule5);\n    rules.push(rule6);\n    rules.push(rule7);\n\n  sheet.setConditionalFormatRules(rules);\n\n\n  return result;\n}\n\nfunction save(request){\n  var result = \"SUCCESS\";\n  try{   \n    var data = request.parameter.data;\n    var categoria = request.parameter.categoria;\n    var oQue = request.parameter.oQue;\n    var como = request.parameter.como;\n    var quem = request.parameter.quem;\n    var prazo = request.parameter.prazo;\n    var status = request.parameter.status;\n    var feedBack = request.parameter.feedBack;\n    var obs = request.parameter.obs;\n    var id = request.parameter.id;\n    var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n    sheet.setConditionalFormatRules\n    sheet.appendRow([data, categoria, oQue, como,quem,prazo,status,feedBack,obs]);\n  }catch(exc){\n    result = exc;\n  }\n  return result;\n\n}\n\n\nfunction edit(request){\n  var result = \"SUCCESS\";\n  try{   \n    var row = request.parameter.rowToEdit;\n    var data = request.parameter.data;\n    var categoria = request.parameter.categoria;\n    var oQue = request.parameter.oQue;\n    var como = request.parameter.como;\n    var quem = request.parameter.quem;\n    var prazo = request.parameter.prazo;\n    var status = request.parameter.status;\n    var feeBack = request.parameter.feeBack;\n    var obs = request.parameter.obs;\n    var id = request.parameter.id;\n    var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n    sheet.getRange(row,1,1,9).setValues([[data, categoria,oQue,como,quem,prazo,status,feeBack,obs]]);\n  }catch(exc){\n    result = exc;\n  }\n  return result;\n}\n\nfunction deleteRow(request){\n  var result = \"SUCCESS\";\n  try{   \n    var row = request.parameter.rowToEdit; \n    var id = request.parameter.id;\n    var sheet = SpreadsheetApp.openById(id).getSheets()[0];\n    sheet.deleteRow(row);   \n  }catch(exc){\n    result = exc;\n  }\n  return result;\n}\n\n\n\n\n",
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
