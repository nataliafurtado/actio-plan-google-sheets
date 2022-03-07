import 'package:flutter/cupertino.dart';
import 'package:google_action_plan/modules/landing_page/landing_page.dart';
// import 'package:google_action_plan/modules/landing_page/widgets/configurations.dart';
// import 'package:google_action_plan/modules/landing_page/landing_page.dart';
import 'package:google_action_plan/modules/list/list_page.dart';
import 'package:google_action_plan/modules/login/launch_to_gcp.dart';
// import 'package:google_action_plan/modules/login/test_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (ctx) => const LandingPage(),
  '/list-page': (ctx) => const ListPage(),
  '/launch-to-gcp': (ctx) => const LauchToGcp(),
};
