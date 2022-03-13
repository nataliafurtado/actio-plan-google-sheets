import 'package:flutter/material.dart';
import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/widgets/dialog_circular_progress_indicator.dart';
import 'package:mobx/mobx.dart';

import 'package:google_action_plan/models/action.dart';

part 'action_controller.g.dart';

class ActionController = ActionControllerBase with _$ActionController;

abstract class ActionControllerBase with Store {
  final ListRepository listRepository;
  ActionControllerBase({
    required this.listRepository,
  });

  @observable
  ActionEvent? editableActionEvent;

  List<String> responsablesList = [];
  List<String> categories = [];
  String selectedResponsable = '';
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
    selectedResponsable = editableActionEvent!.quem!;
    controllerFeedBack.text = editableActionEvent!.feedBack!;
    controllerObs.text = editableActionEvent!.obs!;
    prazo = editableActionEvent!.prazo!;
    data = editableActionEvent!.data!;
    selectedStatus = editableActionEvent!.status!;
  }

  saveActionEvent() async {
    print(controllerQuem.text);
    // showCustomDialog(const DialogCircularProgressIndicator());
    // // listRepository
    // // await _listRepository.doPost(loadActionEventObject());
    // await Future.delayed(const Duration(seconds: 1));
    // // Navigator.popAndPushNamed(context, '/list-page');
  }

  ActionEvent loadActionEventObject() {
    return ActionEvent(
      data: formatData(data, false),
      categoria: controllerCategoria.text,
      oQue: controllerOque.text,
      como: controllerComo.text,
      quem: selectedResponsable,
      prazo: formatData(prazo, false),
      status: selectedStatus,
      feedBack: controllerFeedBack.text,
      obs: controllerObs.text,
      rowToEdit:
          editableActionEvent == null ? "" : editableActionEvent!.rowToEdit,
    );
  }

  deleteactionEvent(int index) async {
    showCustomDialog(const DialogCircularProgressIndicator());
    // await _listRepository.doPost(ActionEvent(
    //   rowToEdit: action.rowToEdit,
    //   action: Constants.delete,
    // ));
    // Navigator.pop(context);
    // loadData();
  }
}
