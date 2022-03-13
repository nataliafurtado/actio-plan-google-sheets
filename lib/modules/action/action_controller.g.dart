// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActionController on ActionControllerBase, Store {
  final _$editableActionEventAtom =
      Atom(name: 'ActionControllerBase.editableActionEvent');

  @override
  ActionEvent? get editableActionEvent {
    _$editableActionEventAtom.reportRead();
    return super.editableActionEvent;
  }

  @override
  set editableActionEvent(ActionEvent? value) {
    _$editableActionEventAtom.reportWrite(value, super.editableActionEvent, () {
      super.editableActionEvent = value;
    });
  }

  final _$responsablesAtom = Atom(name: 'ActionControllerBase.responsables');

  @override
  List<String> get responsablesList {
    _$responsablesAtom.reportRead();
    return super.responsablesList;
  }

  @override
  set responsablesList(List<String> value) {
    _$responsablesAtom.reportWrite(value, super.responsablesList, () {
      super.responsablesList = value;
    });
  }

  final _$initAsyncAction = AsyncAction('ActionControllerBase.init');

  @override
  Future init(ActionEvent? actionPassed) {
    return _$initAsyncAction.run(() => super.init(actionPassed));
  }

  @override
  String toString() {
    return '''
editableActionEvent: ${editableActionEvent},
responsables: ${responsablesList}
    ''';
  }
}
