import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/generated/l10n.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/date_picker_prazo.dart';
import 'package:google_action_plan/modules/widgets/drop_down_responsable.dart';
import 'package:google_action_plan/modules/widgets/drop_down_status.dart';

class ActionEventPage extends StatelessWidget {
  const ActionEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListController controllerList =
    //     Provider.of<ListController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).CATEGORIA)),
              TextFormField(
                // controller: controllerList.controllerCategoria,
                decoration: Style.inputDecoration(),
              ),
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).O_QUE)),
              TextFormField(
                // controller: controllerList.controllerOque,
                decoration: Style.inputDecoration(),
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).COMO)),
              TextFormField(
                // controller: controllerList.controllerComo,
                decoration: Style.inputDecoration(),
                maxLines: 5,
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).QUEM)),
              const DropDownResponsable(),
              //
              Container(height: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).PRAZO)),
              //
              const DatePickerPrazo(),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).SATUS)),
              const DropDownStatus(),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).FEED_BACK)),
              TextFormField(
                // controller: controllerList.controllerFeedBack,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.of(context).OBS)),
              TextFormField(
                // controller: controllerList.controllerObs,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              Container(height: 40),
              Button(S.of(context).SALVAR, () {
                // controllerList.saveActionEvent();
              }),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
