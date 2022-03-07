import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/google_sign_in_button.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/login_developed_by.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final double paddingSides = 24;
  final totalSizeOfAllWidgets = 630;
  // final _formKey = GlobalKey<FormState>();

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(height: Style.topPadding),
          TitleWidget(
            'Plano de Ação',
          ),
          Expanded(child: Container(height: 35)),
          const Image(
            image: AssetImage("lib/assets/images/planilhas.png"),
            height: 200.0,
          ),
          Container(height: 50),
          GoogleSignInButton(
            signIn: () {
              GetIt.I.get<LoginController>().makeLogin(context);
            },
          ),
          Expanded(child: Container(height: 35)),
          const LoginDevelopedBy(),
          Container(height: 50),
        ],
      ),
    );
  }
}
