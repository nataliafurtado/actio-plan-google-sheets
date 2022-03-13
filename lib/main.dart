// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_action_plan/config/routes.dart';
import 'package:google_action_plan/config/setup_dependencies.dart';
import 'package:google_action_plan/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.getNavigator(),
      title: 'Flutter Demo',
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (ctx, _, __) {
            return routes[settings.name]!(
              ctx,
            );
          },
        );
      },
      theme: ThemeData(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
