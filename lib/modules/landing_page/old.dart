import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/generated/l10n.dart';
import 'package:google_action_plan/modules/landing_page/widgets/image_text_widget.dart';
import 'package:google_action_plan/modules/widgets/button.dart';

class Configurations2 extends StatelessWidget {
  final double totalSizeOfAllWidgets = 650;
  final _formKey = GlobalKey<FormState>();

  Configurations2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 120),
              Text(
                S.of(context).INTRUCOES_DE_INSTALACAO,
                style: Style.bold.copyWith(fontSize: 18),
              ),
              Container(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).UTILIZE_UM_NAVEGADOR_WEB,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).NAO_E_POSSIVEL_FAZER,
                ),
              ),
              ImageTextWidget(
                text: S.of(context).UM,
                image: 'lib/assets/images/page1.png',
              ),

              ImageTextWidget(
                text: S.of(context).DOIS,
                image: 'lib/assets/images/page2.png',
              ),

              ImageTextWidget(
                text: S.of(context).TRES,
                image: 'lib/assets/images/page3.png',
              ),

              //
              ImageTextWidget(
                text: S.of(context).QUATRO,
                image: 'lib/assets/images/page4.png',
              ),

              Container(height: 10),
              Container(
                padding: const EdgeInsets.all(24),
                child: Button(S.of(context).COPIAR_SCRIPT, () {}),
              ),
              Text(
                S.of(context).NAO_ESQUECA_DE_SALVAR,
                style: Style.bold.copyWith(fontSize: 18),
              ),
              ImageTextWidget(
                text: S.of(context).CINCO,
                image: 'lib/assets/images/page5.png',
              ),
              ImageTextWidget(
                text: S.of(context).SEIS,
                image: 'lib/assets/images/page6.png',
              ),

              ImageTextWidget(
                text: S.of(context).SETE,
                image: 'lib/assets/images/page7.png',
              ),

              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).SELECIONE_QUALQUER_PESSOA,
                ),
              ),

              ImageTextWidget(
                text: S.of(context).OITO,
                image: 'lib/assets/images/page8.png',
              ),

              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).VOCE_MESMO_ESTA,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).E_ESTA_PERMITINDO,
                ),
              ),

              ImageTextWidget(
                text: S.of(context).NOVE,
                image: 'lib/assets/images/page9.png',
              ),

              ImageTextWidget(
                text: S.of(context).DEZ,
                image: 'lib/assets/images/page10.png',
              ),

              ImageTextWidget(
                text: S.of(context).ONZE,
                image: 'lib/assets/images/page11.png',
              ),
              Container(height: 30),

              Text(
                S.of(context).DOZE,
                style: Style.bold.copyWith(fontSize: 18),
              ),
              Container(height: 30),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: Style.inputDecoration(
                      hint: S.of(context).COLE_AQUI_A_URL),
                  validator: (String? text) {
                    if (text!.isEmpty) {
                      return S.of(context).O_CAMPO_E_OBRIGATORIO;
                    }
                    return null;
                  },
                ),
              ),
              Container(height: 50),
              Button(S.of(context).IR_PARA_O_PLANO_DE_ACAO, () {}),
              Container(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
