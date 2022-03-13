import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/models/action.dart';
import 'package:google_action_plan/modules/action/action_controller.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/date_picker_prazo.dart';
import 'package:google_action_plan/modules/widgets/drop_down_category.dart';
import 'package:google_action_plan/modules/widgets/drop_down_responsable.dart';
import 'package:google_action_plan/modules/widgets/drop_down_status.dart';

class ActionPage extends StatefulWidget {
  final ActionEvent? action;
  const ActionPage({
    Key? key,
    this.action,
  }) : super(key: key);

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  late ActionController controller;
  @override
  void initState() {
    controller = GetIt.I.get<ActionController>();
    controller.init(widget.action);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Categoria')),
              const DropDownCategory(),
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('O que ')),
              TextFormField(
                controller: controller.controllerOque,
                decoration: Style.inputDecoration(),
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10), child: const Text('Como')),
              TextFormField(
                controller: controller.controllerComo,
                decoration: Style.inputDecoration(),
                maxLines: 5,
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10), child: const Text('Quem')),
              const DropDownResponsable(),
              //
              Container(height: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Prazo')),
              //
              const DatePickerPrazo(),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Status')),
              const DropDownStatus(),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Feed Back')),
              TextFormField(
                controller: controller.controllerFeedBack,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              //
              Container(height: 10),
              Container(
                  padding: const EdgeInsets.all(10), child: const Text('Obs')),
              TextFormField(
                controller: controller.controllerObs,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              Container(height: 40),
              Button('Salvar', () {
                controller.saveActionEvent();
              }),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
