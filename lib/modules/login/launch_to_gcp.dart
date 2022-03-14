import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';
import 'package:google_action_plan/modules/login/widgets/copy_button.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/pad.dart';
import 'package:google_action_plan/services/cache/project_cache.dart';
import 'package:url_launcher/url_launcher.dart';

class LauchToGcp extends StatelessWidget {
  const LauchToGcp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: Style.topPadding),
            TitleWidget(
              'Configuração do servidor',
            ),
            Pad(
              widgets: [
                const SizedBox(height: 25),
                Text(
                  '    Seu projeto ja foi criado, mas para poder ter acesso por esse aplicativo é preciso associar o seu projeto a um servidor autorizado.',
                  style: Style.text,
                ),
                const SizedBox(height: 50),
                Text(
                  '    Para fazer isso é necessário ir na página de configuração do seu projeto.',
                  style: Style.text,
                ),
                const SizedBox(height: 15),
                const Image(
                  image: AssetImage("lib/assets/images/gcp.png"),
                ),
                Text(
                  '    Apertar em Alterar projeto',
                  style: Style.text,
                ),
                const SizedBox(height: 50),
                Text(
                  '    Em seguida colar o número do servidor autorizado',
                  style: Style.text,
                ),
                const Image(
                  image: AssetImage("lib/assets/images/def_pro.png"),
                ),
                Text(
                  '    E apertar em Definir projeto',
                  style: Style.text,
                ),
                const SizedBox(height: 50),
                const CopyButton(),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    final id =
                        GetIt.I.get<ProjectCache>().getProject()!.scriptId;
                    await launch(
                      "https://script.google.com/home/projects/$id/settings",
                    );
                  },
                  child: const Text(
                    '    Aperte aqui para ir à página de configuração do seu projeto',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  '    Pronto, já está tudo configurado para poder utilizar sua planilha da plano de ação do Google Docs',
                  style: Style.text,
                ),
                const SizedBox(height: 25),
                Button('Ir para a planilha', () async {
                  await GetIt.I.get<ListRepository>().runScripts();
                  Navigator.pushNamed(context, '/list-page');
                }),
                const SizedBox(height: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
