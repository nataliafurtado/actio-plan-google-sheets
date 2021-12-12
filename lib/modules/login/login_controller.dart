import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  GoogleSignInAccount? googleSignInAccount;
  String? token;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      // 'https://www.googleapis.com/auth/drive',
      // 'https://www.googleapis.com/auth/drive.file',
      // 'https://www.googleapis.com/auth/drive.readonly',
      // 'https://www.googleapis.com/auth/drive.file',
      // 'https://www.googleapis.com/auth/drive',
      // 'https://www.googleapis.com/auth/spreadsheets',
      //.currentonly
      // 'https://www.googleapis.com/auth/spreadsheets.readonly',
      //
      'https://www.googleapis.com/auth/script.projects',
      // 'https://www.googleapis.com/auth/script.processes',
      'https://www.googleapis.com/auth/script.deployments',
    ],
    // clientId:
    //     '280281413857-b85n70e100d4at6f0m8nngt76ok4mc6q.apps.googleusercontent.com',
  );

  Future<void> makeLogin() async {
    try {
      googleSignInAccount = await _googleSignIn.signIn();

      final ggAuth = await googleSignInAccount!.authentication;
      // ignore: avoid_print
      print(ggAuth.idToken);
      // ignore: avoid_print
      print(ggAuth.accessToken);
      token = ggAuth.accessToken!;
      // ignore: avoid_print
      print(googleSignInAccount!.email);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> makeLogout() => _googleSignIn.disconnect();
}
