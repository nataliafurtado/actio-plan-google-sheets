import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/di.dart';

class NavigatorObserverBot extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      GetIt.I.get<DI>().loadPagePath(route.settings.name!);
    }
  }
}
