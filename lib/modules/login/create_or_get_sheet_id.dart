import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/pad.dart';
import 'package:google_action_plan/services/navigator_service.dart';

class CreateOrGetSheetId extends StatelessWidget {
  CreateOrGetSheetId({Key? key}) : super(key: key);

  final controllerScript = TextEditingController();
  final controllerDeploy = TextEditingController();
  final controllersheetId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const spa = SizedBox(height: 50);
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
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
                  () async {
                    await GetIt.I.get<ListRepository>().loadOldSheetData(
                          // controllerScript.text,
                          // controllerDeploy.text,
                          // controllersheetId.text,
                          '1gPTh3G3AYtpJ_CAaowBJe2es1mpu8MPYWrD-2QOSqiwJclxXiTRapvhe',
                          'AKfycbweRe_Tb4Xx6tT8s2-qjcR4piVpujM6hLWIpMzcFvvdz7uc9pAK0CZqyXRzGtW0fpeJ',
                          '1nTLdynCJJkRCKOmHK8Sw3jbGLD7y3zVU3C67L5Eg8Fc',
                        );
                    await Navigator.popAndPushNamed(
                      NavigationService.getNavigator().currentContext!,
                      '/list-page',
                    );
                  },
                ),
                spa,
                //
                TitleWidget(
                  'Quero criar uma planilha do zero',
                ),

                spa,
                Button(
                  'Criar do zero',
                  () async {
                    await GetIt.I.get<ListRepository>().makeInitialConfig();

                    Navigator.pushNamed(
                      NavigationService.getNavigator().currentContext!,
                      '/launch-to-gcp',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
