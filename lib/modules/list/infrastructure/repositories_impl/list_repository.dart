// import 'dart:convert' as convert;
//
// import 'package:get_it/get_it.dart';
// import 'package:google_action_plan/id_sheet_singleton.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';

class ListRepository {
  final LoginController loginController;
  final Dio dio;
  ListRepository({required this.loginController, required this.dio});

  String? sid;
  String? depId;

  Future<void> doGet() async {
    try {
      var response = await dio.get(
        'https://script.google.com/macros/s/AKfycbxEsDqallvYvPKDkZRhnH_6HZjnEIvIusAn-lKHfFKsd3rMRJx7t42vM1xUyhuDv1pW/exec',
      );

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

  Future<bool> doPost() async {
    // String url = Provider.of<GlobalAccess>(
    //         NavigationService.getNavigator().currentState.context,
    //         listen: false)
    //     .controllerIdSheet
    //     .text;

    // var response = await http.post(url, body: actionEvent.toJson());
    // if (response.statusCode == 200 && response.statusCode == 302) {
    //   return true;
    // } else {
    //   // showCustomDialog(DialogTeste(
    //   //   teste: "Ups! Algo deu errado",
    //   // ));
    //   return false;
    // }
    return false;
  }

  int e = 26;
  Future<void> createProject() async {
    try {
      e = e + 1;
      var response = await dio.post(
        'https://script.googleapis.com/v1/projects',
        data: {
          "title": "TestNat$e",
          // "parentId": "1vW6Lig6kuEbUjIyDajvUDqUULgHpNlA8iNFDg_MQ1_E"
        },
      );
      sid = response.data['scriptId'];
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
        'https://script.googleapis.com/v1/projects/$sid/content',
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
      var response = await dio.put(
        'https://script.googleapis.com/v1/projects/$sid/content',
        data: json.decode(updateProjectJson),
      );
      // ignore: avoid_print
      print(response);
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
          "createTime": "2021-11-22T23:20:27.976Z"
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
      print(depId);
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

  Future<void> runScript() async {
    try {
      var response = await dio
          .post('https://script.googleapis.com/v1/scripts/{{sid}}:run', data: {
        "versionNumber": 2,
        "manifestFileName": "appsscript",
        "description": "dddd"
      });
      // ignore: avoid_print
      print(response);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

const updateProjectJson = r'''
{
  "files": [
    {
      "name": "appsscript",
      "type": "JSON",
      "source": "{\n  \"timeZone\": \"America/New_York\",\n  \"dependencies\": {\n  },\n  \"exceptionLogging\": \"STACKDRIVER\",\n  \"runtimeVersion\": \"V8\",\n  \"webapp\": {\n    \"executeAs\": \"USER_ACCESSING\",\n    \"access\": \"MYSELF\"\n  }\n}",
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
      "source": "/**\n * @OnlyCurrentDoc\n */\n\nfunction doPost(request){\n\n}\n\nfunction doGet(request){\n   try{\n    var ssNew = SpreadsheetApp.create(\"Finances\");\n    ssNew.addEditor('jefguns@gmail.com');\n\n  }catch(exc){\n   console.log(\"Somenthing went wrong\");  \n  }\n  var JSONString = JSON.stringify(ssNew.getUrl());\n  var JSONOutput = ContentService.createTextOutput(JSONString);\n  JSONOutput.setMimeType(ContentService.MimeType.JSON);\n  return JSONOutput\n}",
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
