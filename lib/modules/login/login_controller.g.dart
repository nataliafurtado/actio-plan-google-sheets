// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$loginPageStateAtom = Atom(name: 'LoginControllerBase.loginPageState');

  @override
  LoginPageState get loginPageState {
    _$loginPageStateAtom.reportRead();
    return super.loginPageState;
  }

  @override
  set loginPageState(LoginPageState value) {
    _$loginPageStateAtom.reportWrite(value, super.loginPageState, () {
      super.loginPageState = value;
    });
  }

  @override
  String toString() {
    return '''
loginPageState: ${loginPageState}
    ''';
  }
}
