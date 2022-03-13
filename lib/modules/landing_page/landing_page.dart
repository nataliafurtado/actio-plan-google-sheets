import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/modules/login/login_page.dart';

import 'landing_page_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    LandingPageController controller = GetIt.I.get<LandingPageController>();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controllerGlobalAcess.checkIfAlreadyHasIDSetted(context);
    // });

    return Scaffold(
      body: Observer(builder: (_) {
        return showPage(controller);
      }),
    );
  }

  Widget showPage(LandingPageController controllerGlobalAcess) {
    if (controllerGlobalAcess.selectPageIndex == 0) {
      return const LoginPage();
    } else if (controllerGlobalAcess.selectPageIndex == 1) {
      return Container();
    }
    return Container();
  }
}
