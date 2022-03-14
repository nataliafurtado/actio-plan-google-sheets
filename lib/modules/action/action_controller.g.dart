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

  final _$actionPageStateAtom =
      Atom(name: 'ActionControllerBase.actionPageState');

  @override
  ActionPageState get actionPageState {
    _$actionPageStateAtom.reportRead();
    return super.actionPageState;
  }

  @override
  set actionPageState(ActionPageState value) {
    _$actionPageStateAtom.reportWrite(value, super.actionPageState, () {
      super.actionPageState = value;
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
actionPageState: ${actionPageState}
    ''';
  }
}
