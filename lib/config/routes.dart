import 'package:flutter/cupertino.dart';
import 'package:google_action_plan/models/action.dart';
import 'package:google_action_plan/modules/action/action_page.dart';
import 'package:google_action_plan/modules/landing_page/landing_page.dart';
import 'package:google_action_plan/modules/list/list_page.dart';
import 'package:google_action_plan/modules/login/launch_to_gcp.dart';

final routes = <String, WidgetBuilder>{
  '/': (ctx) => const LandingPage(),
  '/list-page': (ctx) => const ListPage(),
  '/launch-to-gcp': (ctx) => const LauchToGcp(),
  '/action-page': (ctx) {
    dynamic actionEvent;
    final args = ModalRoute.of(ctx)!.settings.arguments;
    if (args is ActionEvent) {
      actionEvent = args;
    }
    return ActionPage(
      action: actionEvent,
    );
  }
};
