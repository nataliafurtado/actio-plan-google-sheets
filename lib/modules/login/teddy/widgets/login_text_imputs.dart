import 'package:flutter/material.dart';

class LoginTextImputs extends StatelessWidget {
  final GlobalKey<FormState> keyPassed;
  const LoginTextImputs({
    Key? key,
    required this.keyPassed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final controllerTedyy = GetIt.I.get<TeddyController>();
    // final controlleLogin = GetIt.I.get<LoginController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      child: Form(
        key: keyPassed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            // TrackingTextInput(
            //   keyPassed: const Key("imput-login-login"),
            //   textController: controlleLogin.loginController,
            //   label: "Login",
            //   hint: "Digite seu login",
            //   validator: (String text) {
            //     if (text.trim().isEmpty) {
            //       return "Campo não pode ser vazio";
            //     }
            //     return null;
            //   },
            //   onFocusChange: (bool hasFocus) {
            //     if (hasFocus) {
            //       controllerTedyy.lookAt(const Offset(36.0, 436.0));
            //     }
            //   },
            // ),
            // TrackingTextInput(
            //   keyPassed: const Key("imput-login-password"),
            //   textController: controlleLogin.passwordController,
            //   label: "Senha",
            //   hint: "Digite sua senha",
            //   isObscured: true,
            //   onTextChanged: (String value) {
            //     controllerTedyy.setPassword(value);
            //   },
            //   onFocusChange: (bool hasFocus) {
            //     if (hasFocus) {
            //       controllerTedyy.coverEyes(true);
            //     }
            //   },
            //   onCaretMoved: (s) {
            //     if (s == null) {
            //       controllerTedyy.coverEyes(false);
            //       controllerTedyy.lookAt(null);
            //     }
            //   },
            //   validator: (String text) {
            //     if (text.trim().isEmpty) {
            //       return "Campo não pode ser vazio";
            //     }
            //     return null;
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
