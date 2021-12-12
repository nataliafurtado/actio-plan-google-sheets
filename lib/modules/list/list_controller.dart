import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_action_plan/assets/constants.dart';
import 'package:google_action_plan/functions/functions.dart';
// import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/list/presentation/filter/filter_responsable.dart';
import 'package:google_action_plan/modules/list/presentation/filter/filter_status.dart';
import 'package:google_action_plan/modules/widgets/dialog_circular_progress_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_action_plan/generated/l10n.dart';
import 'package:google_action_plan/models/action.dart';

part 'list_controller.g.dart';

class ListController = ListControllerBase with _$ListController;

abstract class ListControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  ListControllerBase(
    this.context,
  );

  // final ListRepository _listRepository = ListRepository();

  @observable
  List<ActionEvent> actions = [];

  List<ActionEvent> actionsNotFiltered = [];
  @observable
  List<String> responsables = [];

  String selectedResponsable = '';

  List<String> status = [
    'EM PROGRESSO',
    'EM ESPERA',
    'ATRASADA',
    "COMPLETA",
    "CANCELADA"
  ];

  String selectedStatus = 'EM PROGRESSO';

  late bool isToSave;
  @observable
  bool isToShowResponsable = false;

  @observable
  String selectedFilterStatus = "";

  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerOque = TextEditingController();
  TextEditingController controllerComo = TextEditingController();

  TextEditingController controllerFeedBack = TextEditingController();
  TextEditingController controllerObs = TextEditingController();
  String prazo = '';
  String data = '';
  late String rowToEdit;

  @action
  loadData() async {
    showCustomDialog(const DialogCircularProgressIndicator());
    selectedFilterStatus = S.of(context).SATUS.toUpperCase();
    selectedResponsable = S.of(context).QUEM.toUpperCase();
    // List<ActionEvent> actionList = await _listRepository.loadActionEvents();
    //   actionsNotFiltered = actionList;
    //   separetaResponsableValues(actionList);
    //   apllySavedFIlters(actionList);
    //   Navigator.pop(context);
  }

  @action
  apllySavedFIlters(actionList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Constants.filtroStatus) &&
        prefs.containsKey(Constants.filtroResponsable)) {
      selectedFilterStatus = prefs.getString(Constants.filtroStatus)!;
      selectedResponsable =
          prefs.getString(Constants.filtroResponsable)!.toUpperCase();
      filter();
    } else if (prefs.containsKey(Constants.filtroStatus)) {
      selectedFilterStatus = prefs.getString(Constants.filtroStatus)!;
      filter();
    } else if (prefs.containsKey(Constants.filtroResponsable)) {
      selectedResponsable =
          prefs.getString(Constants.filtroResponsable)!.toUpperCase();
      filter();
    } else {
      actions = actionList;
    }
  }

  @action
  separetaResponsableValues(List<ActionEvent> list) {
    List<String> responsablesList = [];
    for (var i = 0; i < list.length; i++) {
      responsablesList.add(list[i].quem!);
    }
    responsablesList = responsablesList.toSet().toList();
    if (!responsablesList.contains("")) {
      responsablesList.add("");
    }
    responsables = responsablesList;
    log(responsables.toString());
  }

  // FILTERS
  @action
  filter() {
    if (isFilterStatusAndFilterResponsableSelected()) {
      List<ActionEvent> actionList = [];
      actionList = FilterStatus.fiter(actionsNotFiltered, selectedFilterStatus);
      actions = FilterResponsable.fiter(actionList, selectedResponsable);
    } else if (isFilterStatusSelected()) {
      actions = FilterStatus.fiter(actionsNotFiltered, selectedFilterStatus);
    } else if (isFilterResponsableSelected()) {
      actions =
          FilterResponsable.fiter(actionsNotFiltered, selectedResponsable);
    } else {
      actions = actionsNotFiltered;
    }
  }

  bool isFilterStatusAndFilterResponsableSelected() =>
      selectedFilterStatus != S.of(context).SATUS.toUpperCase() &&
      selectedResponsable != S.of(context).QUEM.toUpperCase();
  bool isFilterStatusSelected() =>
      selectedFilterStatus != S.of(context).SATUS.toUpperCase();
  bool isFilterResponsableSelected() =>
      selectedResponsable != S.of(context).QUEM.toUpperCase();

  @action
  filterStatusActions(String statusPassed) {
    saveFilter(statusPassed, Constants.filtroStatus);
    selectedFilterStatus = statusPassed;
    filter();
  }

  @action
  filterResponsableActions(String responsablePassed) {
    saveFilter(responsablePassed, Constants.filtroResponsable);
    selectedResponsable = responsablePassed.toUpperCase();
    filter();
  }

  @action
  filterStatusCleanFilter() {
    deleteFilter(Constants.filtroStatus);
    selectedFilterStatus = S.of(context).SATUS.toUpperCase();
    filter();
  }

  @action
  filterResponsableCleanFilter() {
    deleteFilter(Constants.filtroResponsable);
    selectedResponsable = S.of(context).QUEM.toUpperCase();
    filter();
  }

  saveFilter(String filterPassed, String filterType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(filterType, filterPassed);
  }

  deleteFilter(String filterType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(filterType);
  }

  goToEditActionEventPage(int index) async {
    await loadActionEventControllers(index);
    isToSave = false;
    Navigator.pushNamed(context, '/action-event-page', arguments: this);
  }

  goToNewActionEventPage() async {
    data = DateTime.now().toIso8601String();
    selectedStatus = "EM PROGRESSO";
    isToSave = true;
    selectedResponsable = "";
    controllerCategoria.text = "";
    controllerOque.text = "";
    controllerComo.text = "";
    selectedResponsable = "";
    controllerFeedBack.text = "";
    controllerObs.text = "";
    prazo = "";
    Navigator.pushNamed(context, '/action-event-page', arguments: this);
  }

  loadActionEventControllers(int index) async {
    rowToEdit = actions[index].rowToEdit!;
    controllerCategoria.text = actions[index].categoria!;
    controllerOque.text = actions[index].oQue!;
    controllerComo.text = actions[index].como!;
    selectedResponsable = actions[index].quem!;
    controllerFeedBack.text = actions[index].feedBack!;
    controllerObs.text = actions[index].obs!;
    prazo = actions[index].prazo!;
    data = actions[index].data!;
    selectedStatus = actions[index].status!;
  }

  saveActionEvent() async {
    showCustomDialog(const DialogCircularProgressIndicator());
    // await _listRepository.doPost(loadActionEventObject());
    await Future.delayed(const Duration(seconds: 1));
    Navigator.popAndPushNamed(context, '/list-page');
  }

  ActionEvent loadActionEventObject() {
    if (isToSave) {
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
        rowToEdit: "",
        action: Constants.save,
      );
    } else {
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
        rowToEdit: rowToEdit,
        action: Constants.edit,
      );
    }
  }

  deleteactionEvent(int index) async {
    showCustomDialog(const DialogCircularProgressIndicator());
    // await _listRepository.doPost(ActionEvent(
    //   rowToEdit: actions[index].rowToEdit,
    //   action: Constants.delete,
    // ));
    Navigator.pop(context);
    loadData();
  }

  @action
  changeShowResponsableInCard() {
    isToShowResponsable = !isToShowResponsable;
  }
}
