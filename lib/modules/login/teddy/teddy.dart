import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';

import 'teddy_controller.dart';

class Teddy extends StatelessWidget {
  const Teddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Style.iceBackground,
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: FlareActor(
        "lib/assets/Teddy.flr",
        shouldClip: false,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
        controller: GetIt.I.get<TeddyController>(),
      ),
    );
  }
}
