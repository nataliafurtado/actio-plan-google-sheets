import 'package:flutter/material.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/list/presentation/filter/filter_responsable.dart';
import 'package:google_action_plan/modules/list/presentation/filter/filter_status.dart';
import 'package:mobx/mobx.dart';

import 'package:google_action_plan/data/models/action.dart';

part 'list_controller.g.dart';

enum ListPageState {
  loading,
  success,
}

class ListController = ListControllerBase with _$ListController;

abstract class ListControllerBase with Store {
  final ListRepository listRepository;
  ListControllerBase({
    required this.listRepository,
  });

  @observable
  List<ActionEvent> actions = [];

  @observable
  ListPageState listPageState = ListPageState.loading;

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

  late bool isToSave;
  @observable
  bool isToShowResponsable = true;

  @observable
  String selectedFilterStatus = "";

  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerOque = TextEditingController();
  TextEditingController controllerComo = TextEditingController();

  TextEditingController controllerFeedBack = TextEditingController();
  TextEditingController controllerObs = TextEditingController();

  String data = '';
  late String rowToEdit;

  @action
  loadData() async {
    listPageState = ListPageState.loading;
    selectedFilterStatus = "STATUS";
    selectedResponsable = "QUEM";
    List<ActionEvent> actionList = await listRepository.loadRows();
    actionsNotFiltered = actionList;
    responsables = listRepository.getResResponsablesList();
    actions = actionList;
    // apllySavedFIlters(actionList);
    listPageState = ListPageState.success;
  }

  @action
  apllySavedFIlters(actionList) async {
    // if (prefs.containsKey(Constants.filtroStatus) &&
    //     prefs.containsKey(Constants.filtroResponsable)) {
    //   selectedFilterStatus = prefs.getString(Constants.filtroStatus)!;
    //   selectedResponsable =
    //       prefs.getString(Constants.filtroResponsable)!.toUpperCase();
    //   filter();
    // } else if (prefs.containsKey(Constants.filtroStatus)) {
    //   selectedFilterStatus = prefs.getString(Constants.filtroStatus)!;
    //   filter();
    // } else if (prefs.containsKey(Constants.filtroResponsable)) {
    //   selectedResponsable =
    //       prefs.getString(Constants.filtroResponsable)!.toUpperCase();
    //   filter();
    // } else {
    //   actions = actionList;
    // }
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
      selectedFilterStatus != "STATUS" && selectedResponsable != "QUEM";
  bool isFilterStatusSelected() => selectedFilterStatus != "STATUS";
  bool isFilterResponsableSelected() => selectedResponsable != "QUEM";

  @action
  filterStatusActions(String statusPassed) {
    // saveFilter(statusPassed, Constants.filtroStatus);
    selectedFilterStatus = statusPassed;
    filter();
  }

  @action
  filterResponsableActions(String responsablePassed) {
    // saveFilter(responsablePassed, Constants.filtroResponsable);
    selectedResponsable = responsablePassed.toUpperCase();
    filter();
  }

  @action
  filterStatusCleanFilter() {
    // deleteFilter(Constants.filtroStatus);
    selectedFilterStatus = "STATUS";
    filter();
  }

  @action
  filterResponsableCleanFilter() {
    // deleteFilter(Constants.filtroResponsable);
    selectedResponsable = "QUEM";
    filter();
  }

  saveFilter(String filterPassed, String filterType) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString(filterType, filterPassed);
  }

  deleteFilter(String filterType) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove(filterType);
  }

  deleteactionEvent(int index) async {
    await listRepository.deleteActionEvent(
      actions[index],
    );
    loadData();
  }

  goToEditActionEventPage({required BuildContext context, int? index}) {
    dynamic actionEvenToEdit;
    if (index != null) {
      actionEvenToEdit = actions[index];
    }
    Navigator.of(context)
        .pushNamed("/action-page", arguments: actionEvenToEdit);
  }

  @action
  changeShowResponsableInCard() {
    isToShowResponsable = !isToShowResponsable;
  }
}
