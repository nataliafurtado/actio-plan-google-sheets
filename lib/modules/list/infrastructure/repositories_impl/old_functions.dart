// Future<void> doGet() async {
//   try {
//     var response = await dio.get('');

//     // ignore: avoid_print
//     print(response);
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }

//   // String? url = GetIt.I.get<IdSheetSingleton>().controllerIdSheet;

//   // List<ActionEvent> newList = [];
//   // var response = await http.get(url);
//   // if (response.statusCode == 200 && response.body.isNotEmpty) {
//   //   List<dynamic> j = convert.jsonDecode(response.body);
//   //   for (var i = 0; i < j.length; i++) {
//   //     newList.add(ActionEvent.fromJson(j[i], i));
//   //   }
//   // } else if (response.statusCode == 200) {
//   // } else {
//   //   print("Dialog ocorreu um erro");
//   //   showCustomDialog(DialogTeste(
//   //     teste: "Ups! Algo deu errado",
//   //   ));
//   // }
//   // return newList;
// }

// Future<void> doPost() async {
//   try {
//     var d = ActionEvent(
//       action: Constants.config,
//     );
//     var response = await dio.post(
//       '',
//       data: d.toJson(),
//     );

//     if (response.statusCode == 200 && response.statusCode == 302) {
//     } else {
//       // showCustomDialog(DialogTeste(
//       //   teste: "Ups! Algo deu errado",
//       // ));

//     }
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }
// }

//   Future<void> getDeploy() async {
//   try {
//     var response = await dio.get(
//       'https://script.googleapis.com/v1/projects/$sid/deployments/$depId',
//     );
//     // ignore: avoid_print
//     print(response);
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }
// }

//   Future<void> listVersion() async {
//   try {
//     var response = await dio.get(
//       'https://script.googleapis.com/v1/projects/$sid/versions',
//     );
//     // ignore: avoid_print
//     print(response);
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }
// }

//   Future<void> listProcesses() async {
//   try {
//     var response = await dio.get(
//       'https://script.googleapis.com/v1/processes',
//     );
//     // ignore: avoid_print
//     print(response);
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }

//     Future<void> getProjectContent() async {
//   try {
//     var response = await dio.get(
//       'https://script.googleapis.com/v1/projects/1ULrEBtYaoadBXTYl8wL8gS8mCLtYuXiiW5dofFG0jIazq1BaroslPFg2/content',
//       // 'https://script.googleapis.com/v1/projects/1TF1qWH6Fj4TRlgi4F-Z3hxhdYc5OGHCsuCtVtK2QYJQrTWsIEtDbCp-5/content',
//     );

//     // ignore: avoid_print
//     print(response);
//   } catch (e) {
//     // ignore: avoid_print
//     print(e);
//   }
// }
