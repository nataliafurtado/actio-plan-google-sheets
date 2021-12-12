// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LandingPageController on LandingPageControllerBase, Store {
  final _$selectPageIndexAtom =
      Atom(name: 'LandingPageControllerBase.selectPageIndex');

  @override
  int get selectPageIndex {
    _$selectPageIndexAtom.reportRead();
    return super.selectPageIndex;
  }

  @override
  set selectPageIndex(int value) {
    _$selectPageIndexAtom.reportWrite(value, super.selectPageIndex, () {
      super.selectPageIndex = value;
    });
  }

  final _$LandingPageControllerBaseActionController =
      ActionController(name: 'LandingPageControllerBase');

  @override
  dynamic nextPage() {
    final _$actionInfo = _$LandingPageControllerBaseActionController
        .startAction(name: 'LandingPageControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$LandingPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic lastPage() {
    final _$actionInfo = _$LandingPageControllerBaseActionController
        .startAction(name: 'LandingPageControllerBase.lastPage');
    try {
      return super.lastPage();
    } finally {
      _$LandingPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectPageIndex: ${selectPageIndex}
    ''';
  }
}
