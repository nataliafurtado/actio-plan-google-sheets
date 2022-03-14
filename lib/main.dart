import 'package:flutter/material.dart';
import 'package:google_action_plan/config/page_rout_builder_wrapper.dart';
import 'package:google_action_plan/config/routes.dart';
import 'package:google_action_plan/config/setup_dependencies.dart';
import 'package:google_action_plan/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.getNavigator(),
      title: 'Plano de ação',
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (ctx, _, __) {
            return PageRouteBuilderWrapper(
              routes[settings.name]!(
                ctx,
                settings.arguments,
              ),
              settings.name!,
            );
          },
        );
      },
      theme: ThemeData(),
      initialRoute: '/',
    );
  }
}
