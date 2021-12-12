import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/di.dart';

class PageRouteBuilderWrapper extends StatefulWidget {
  final Widget child;
  final String path;
  const PageRouteBuilderWrapper(
    this.child,
    this.path, {
    Key? key,
  }) : super(key: key);

  @override
  _PageRouteBuilderWrapperState createState() =>
      _PageRouteBuilderWrapperState();
}

class _PageRouteBuilderWrapperState extends State<PageRouteBuilderWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    GetIt.I.get<DI>().resetInstances(widget.path);
  }
}
