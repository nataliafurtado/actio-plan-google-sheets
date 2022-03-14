import 'package:flutter/cupertino.dart';
import 'package:google_action_plan/data/models/action.dart';
import 'package:google_action_plan/modules/action/action_page.dart';
import 'package:google_action_plan/modules/list/list_page.dart';
import 'package:google_action_plan/modules/login/launch_to_gcp.dart';
import 'package:google_action_plan/modules/login/login_page.dart';

final routes = <String, Function(BuildContext context, Object? args)>{
  '/': (ctx, args) => const LoginPage(),
  '/list-page': (ctx, args) => const ListPage(),
  '/launch-to-gcp': (ctx, args) => const LauchToGcp(),
  '/action-page': (ctx, args) => ActionPage(
        action: args != null ? args as ActionEvent : null,
      ),
};
