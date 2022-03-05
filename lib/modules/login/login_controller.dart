import 'package:flutter/cupertino.dart';
import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final ListRepository listRepository;
  LoginController({required this.listRepository});

  GoogleSignInAccount? googleSignInAccount;
  String? token;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  Future<void> makeLogin(context) async {
    try {
      googleSignInAccount = await _googleSignIn.signIn();

      final ggAuth = await googleSignInAccount!.authentication;
      // ignore: avoid_print
      // print(ggAuth.idToken);
      // ignore: avoid_print
      // print(ggAuth.accessToken);
      token = ggAuth.accessToken!;
      // ignore: avoid_print
      print(googleSignInAccount!.email);
      await listRepository.makeInitialConfig();

      Navigator.pushNamed(context, '/launch-to-gcp');
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> makeLogout() => _googleSignIn.disconnect();
}
