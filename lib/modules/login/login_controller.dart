import 'package:flutter/cupertino.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/services/navigator_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

enum LoginPageState {
  loading,
  success,
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final ListRepository listRepository;
  LoginControllerBase({required this.listRepository});

  GoogleSignInAccount? googleSignInAccount;
  String? token;

  @observable
  LoginPageState loginPageState = LoginPageState.success;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      // 'https://www.googleapis.com/auth/drive',
      // 'https://www.googleapis.com/auth/drive.file',
      // 'https://www.googleapis.com/auth/drive.readonly',
      // 'https://www.googleapis.com/auth/drive.file',
      // 'https://www.googleapis.com/auth/drive',
      'https://www.googleapis.com/auth/spreadsheets',
      //.currentonly
      // 'https://www.googleapis.com/auth/spreadsheets.readonly',
      //
      'https://www.googleapis.com/auth/script.projects',
      // 'https://www.googleapis.com/auth/script.processes',
      'https://www.googleapis.com/auth/script.deployments',
    ],
    clientId:
        '280281413857-70ucdtinbmnjp937d91sn0lqrj9s5td6.apps.googleusercontent.com',
  );

  Future<void> makeLogin() async {
    try {
      loginPageState = LoginPageState.loading;
      googleSignInAccount = await _googleSignIn.signIn();

      final ggAuth = await googleSignInAccount!.authentication;
      // // ignore: avoid_print
      // // print(ggAuth.idToken);
      // // ignore: avoid_print
      // // print(ggAuth.accessToken);
      token = ggAuth.accessToken!;
      // ignore: avoid_print
      print(token);
      // print(googleSignInAccount!.email);
      // await listRepository.makeInitialConfig();
      // Navigator.pushNamed(
      //   NavigationService.getNavigator().currentContext!,
      //   '/launch-to-gcp',
      // );
      //
      //
      await Navigator.popAndPushNamed(
        NavigationService.getNavigator().currentContext!,
        '/list-page',
      );
    } catch (error) {
      // ignore: avoid_print
      print(error);
      loginPageState = LoginPageState.success;
    }
  }

  makeAutomaticLogim(context) async {
    await Future.delayed(const Duration(seconds: 1));

    if (await listRepository.loadCachedParameters()) {
      await makeLogin();
    } else {
      loginPageState = LoginPageState.success;
    }
  }

  Future<void> makeLogout() => _googleSignIn.disconnect();
}
