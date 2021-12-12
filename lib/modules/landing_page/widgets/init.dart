import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/generated/l10n.dart';
import 'package:google_action_plan/modules/widgets/button.dart';

import '../landing_page_controller.dart';

class InitPage extends StatelessWidget {
  final double totalSizeOfAllWidgets = 750;

  const InitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LandingPageController controller = GetIt.I.get<LandingPageController>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100),
            configurationsText(context),
            Container(height: 30),
            Image.asset('lib/assets/images/page00.png'),
            Container(
              padding: const EdgeInsets.all(24),
              child: Button(S.of(context).INICIAR_CONFIG, () {
                controller.nextPage();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget configurationsText(context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              S.of(context).PARA_CONFIGURAR_E_NEC,
              style: Style.bold.copyWith(fontSize: 23),
            ),
          ),
          Text(
            S.of(context).E_PRECISO_UMA,
            style: Style.bold.copyWith(fontSize: 17),
          ),
          Text(
            S.of(context).CRIAR_UMA_PLANILHA,
            style: Style.bold.copyWith(fontSize: 17),
          ),
          Text(
            S.of(context).IR_NA_PARTE,
            style: Style.bold.copyWith(fontSize: 17),
          ),
          Text(
            S.of(context).IMPALNTAR_O_SCRIP,
            style: Style.bold.copyWith(fontSize: 17),
          ),
          Text(
            S.of(context).LIBERAR_O_ACESSO,
            style: Style.bold.copyWith(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
