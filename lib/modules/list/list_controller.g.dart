// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on ListControllerBase, Store {
  final _$actionsAtom = Atom(name: 'ListControllerBase.actions');

  @override
  List<ActionEvent> get actions {
    _$actionsAtom.reportRead();
    return super.actions;
  }

  @override
  set actions(List<ActionEvent> value) {
    _$actionsAtom.reportWrite(value, super.actions, () {
      super.actions = value;
    });
  }

  final _$responsablesAtom = Atom(name: 'ListControllerBase.responsables');

  @override
  List<String> get responsables {
    _$responsablesAtom.reportRead();
    return super.responsables;
  }

  @override
  set responsables(List<String> value) {
    _$responsablesAtom.reportWrite(value, super.responsables, () {
      super.responsables = value;
    });
  }

  final _$isToShowResponsableAtom =
      Atom(name: 'ListControllerBase.isToShowResponsable');

  @override
  bool get isToShowResponsable {
    _$isToShowResponsableAtom.reportRead();
    return super.isToShowResponsable;
  }

  @override
  set isToShowResponsable(bool value) {
    _$isToShowResponsableAtom.reportWrite(value, super.isToShowResponsable, () {
      super.isToShowResponsable = value;
    });
  }

  final _$selectedFilterStatusAtom =
      Atom(name: 'ListControllerBase.selectedFilterStatus');

  @override
  String get selectedFilterStatus {
    _$selectedFilterStatusAtom.reportRead();
    return super.selectedFilterStatus;
  }

  @override
  set selectedFilterStatus(String value) {
    _$selectedFilterStatusAtom.reportWrite(value, super.selectedFilterStatus,
        () {
      super.selectedFilterStatus = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('ListControllerBase.loadData');

  @override
  Future loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  final _$apllySavedFIltersAsyncAction =
      AsyncAction('ListControllerBase.apllySavedFIlters');

  @override
  Future apllySavedFIlters(dynamic actionList) {
    return _$apllySavedFIltersAsyncAction
        .run(() => super.apllySavedFIlters(actionList));
  }

  final _$ListControllerBaseActionController =
      ActionController(name: 'ListControllerBase');

  @override
  dynamic filter() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.filter');
    try {
      return super.filter();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterStatusActions(String statusPassed) {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.filterStatusActions');
    try {
      return super.filterStatusActions(statusPassed);
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterResponsableActions(String responsablePassed) {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.filterResponsableActions');
    try {
      return super.filterResponsableActions(responsablePassed);
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterStatusCleanFilter() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.filterStatusCleanFilter');
    try {
      return super.filterStatusCleanFilter();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterResponsableCleanFilter() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.filterResponsableCleanFilter');
    try {
      return super.filterResponsableCleanFilter();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeShowResponsableInCard() {
    final _$actionInfo = _$ListControllerBaseActionController.startAction(
        name: 'ListControllerBase.changeShowResponsableInCard');
    try {
      return super.changeShowResponsableInCard();
    } finally {
      _$ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actions: ${actions},
responsables: ${responsables},
isToShowResponsable: ${isToShowResponsable},
selectedFilterStatus: ${selectedFilterStatus}
    ''';
  }
}
