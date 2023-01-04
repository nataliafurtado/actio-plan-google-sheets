import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/google_sign_in_button.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/login_developed_by.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';
import 'package:google_action_plan/modules/widgets/circular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double paddingSides = 24;
  final totalSizeOfAllWidgets = 630;
  late LoginController controller;
  @override
  void initState() {
    controller = GetIt.I.get<LoginController>();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   controller.makeAutomaticLogim(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: Observer(
        builder: (ctx) {
          if (controller.loginPageState == LoginPageState.loading) {
            return const Circular();
          }

          return Column(
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
                  controller.makeAutomaticLogim(context);
                },
              ),
              Expanded(child: Container(height: 35)),
              const LoginDevelopedBy(),
              Container(height: 50),
            ],
          );
        },
      ),
    );
  }
}
