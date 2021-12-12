import 'package:flutter/cupertino.dart';
// import 'package:google_action_plan/modules/landing_page/landing_page.dart';
import 'package:google_action_plan/modules/list/list_page.dart';
import 'package:google_action_plan/modules/login/login_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (ctx) => const LoginPage(),
  '/list-page': (ctx) => const ListPage(),
};
