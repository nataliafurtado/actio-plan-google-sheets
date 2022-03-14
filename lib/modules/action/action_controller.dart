import 'package:flutter/material.dart';
import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:google_action_plan/data/models/action.dart';

part 'action_controller.g.dart';

enum ActionPageState {
  loading,
  success,
}

class ActionController = ActionControllerBase with _$ActionController;

abstract class ActionControllerBase with Store {
  final ListRepository listRepository;
  ActionControllerBase({
    required this.listRepository,
  }) {
    // ignore: avoid_print
    print('abriu action controller');
  }

  @observable
  ActionEvent? editableActionEvent;

  @observable
  ActionPageState actionPageState = ActionPageState.success;

  List<String> responsablesList = [];
  List<String> categories = [];

  String selectedStatus = 'EM PROGRESSO';
  late bool isNewActionEvent = false;

  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerOque = TextEditingController();
  TextEditingController controllerComo = TextEditingController();

  TextEditingController controllerFeedBack = TextEditingController();
  TextEditingController controllerObs = TextEditingController();
  String prazo = '';
  String data = DateTime.now().toIso8601String();
  final TextEditingController controllerQuem = TextEditingController();

  @action
  init(ActionEvent? actionPassed) async {
    responsablesList = listRepository.getResResponsablesList();
    categories = listRepository.getCategories();
    if (actionPassed != null) {
      editableActionEvent = actionPassed;
      await loadActionEventControllers();
    } else {
      isNewActionEvent = true;
    }
  }

  loadActionEventControllers() async {
    controllerCategoria.text = editableActionEvent!.categoria!;
    controllerOque.text = editableActionEvent!.oQue!;
    controllerComo.text = editableActionEvent!.como!;
    controllerQuem.text = editableActionEvent!.quem!;
    controllerFeedBack.text = editableActionEvent!.feedBack!;
    controllerObs.text = editableActionEvent!.obs!;
    prazo = editableActionEvent!.prazo!;
    data = editableActionEvent!.data!;
    selectedStatus = editableActionEvent!.status!;
  }

  saveActionEvent(BuildContext context) async {
    actionPageState = ActionPageState.loading;
    if (editableActionEvent == null) {
      await listRepository.saveActionEvent(
        loadActionEventObject(),
      );
    } else {
      await listRepository.editActionEvent(
        loadActionEventObject(),
      );
    }

    Navigator.pushNamedAndRemoveUntil(context, "/list-page", (route) => false);
  }

  ActionEvent loadActionEventObject() {
    return ActionEvent(
      data: formatData(data, false),
      categoria: controllerCategoria.text,
      oQue: controllerOque.text,
      como: controllerComo.text,
      quem: controllerQuem.text,
      prazo: formatData(prazo, false),
      status: selectedStatus,
      feedBack: controllerFeedBack.text,
      obs: controllerObs.text,
      rowToEdit:
          editableActionEvent == null ? "" : editableActionEvent!.rowToEdit,
    );
  }
}
