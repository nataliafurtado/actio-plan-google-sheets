import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/login/teddy/widgets/title_widget.dart';

class LauchToGcp extends StatelessWidget {
  const LauchToGcp({Key? key}) : super(key: key);

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
          Expanded(child: Container(height: 35)),
          Container(height: 50),
        ],
      ),
    );
  }
}
