import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/circular.dart';
import 'package:google_action_plan/modules/widgets/pad.dart';
import 'package:google_action_plan/services/navigator_service.dart';

enum PageState {
  loading,
  success,
}

class CreateOrGetSheetId extends StatefulWidget {
  const CreateOrGetSheetId({Key? key}) : super(key: key);

  @override
  State<CreateOrGetSheetId> createState() => _CreateOrGetSheetIdState();
}

class _CreateOrGetSheetIdState extends State<CreateOrGetSheetId> {
  final controllerScript = TextEditingController();

  final controllerDeploy = TextEditingController();

  final controllersheetId = TextEditingController();

  PageState pageState = PageState.success;

  @override
  Widget build(BuildContext context) {
    const spa = SizedBox(height: 50);
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: pageState == PageState.loading
          ? const Circular()
          : SingleChildScrollView(
              child: Pad(
                widgets: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(height: Style.topPadding),
                      TitleWidget(
                        'Ja tenho uma planilha e quero reutilizar ela',
                      ),
                      spa,
                      TextField(
                        controller: controllerScript,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Digite o scriptId',
                        ),
                      ),
                      spa,
                      TextField(
                        controller: controllerDeploy,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Digite o DeployId',
                        ),
                      ),
                      spa,
                      TextField(
                        controller: controllersheetId,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Digite o sheetId',
                        ),
                      ),
                      spa,
                      Button(
                        'Ir para planilha',
                        goToSheet,
                      ),
                      spa,
                      //
                      TitleWidget(
                        'Quero criar uma planilha do zero',
                      ),
                      spa,
                      Button(
                        'Criar do zero',
                        createSheet,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  goToSheet() async {
    try {
      setState(() {
        pageState = PageState.loading;
      });
      await GetIt.I.get<ListRepository>().loadOldSheetData(
            // controllerScript.text,
            // controllerDeploy.text,
            // controllersheetId.text,
            '1jb-yrvH8bVE5vi84SCFIIUqJXa6BPxL5shoHDJmsNoqsdtCP3zQpGbWu',
            'AKfycbxl70FlrBdeD4u2CZGD-S7C87t29Wc3cjHVtb3q0n731Zv9JRGrNPXOLPaPmqItSfBI',
            '1LmFixYbmaukf2JkcN07r93bmxxvcsqWkaucoMHPaMcg',
          );
      await Navigator.popAndPushNamed(
        NavigationService.getNavigator().currentContext!,
        '/list-page',
      );
    } catch (e) {
      setState(
        () {
          pageState = PageState.success;
        },
      );
    }
  }

  createSheet() async {
    try {
      setState(() {
        pageState = PageState.loading;
      });
      await GetIt.I.get<ListRepository>().makeInitialConfig();

      Navigator.popAndPushNamed(
        NavigationService.getNavigator().currentContext!,
        '/launch-to-gcp',
      );
    } catch (e) {
      setState(
        () {
          pageState = PageState.success;
        },
      );
    }
  }
}
