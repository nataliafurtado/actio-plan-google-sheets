import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/modules/list/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late final LoginController loginController;
  late final ListRepository listRepository;

  @override
  void initState() {
    loginController = GetIt.I.get<LoginController>();
    listRepository = GetIt.I.get<ListRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ddddd'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TT(
              function: loginController.makeLogin,
              text: 'logar',
            ),
            TT(
              function: loginController.makeLogout,
              text: 'sair',
            ),
            TT(
              function: listRepository.createProject,
              text: 'createProject',
            ),
            TT(
              function: listRepository.updateProject,
              text: 'updateProject',
            ),
            TT(
              function: listRepository.createVersion,
              text: 'createVersion',
            ),
            TT(
              function: listRepository.createDeplyment,
              text: 'createDeplyment',
            ),
            TT(
              function: listRepository.runScript,
              text: 'runScript',
            ),
            TT(
              function: () async {
                //
                await launch(
                  "https://script.google.com/home/projects/AKfycbwvUKI-SGwg47YFlBBLCkW85sdDtOGmc4MenUlVGUR3DAeed_GGwa8-nA2qvXitZrffmA/settings",
                );
              },
              text: 'lavu',
            ),
            TT(
              function: () async {
                await listRepository.createProject();
                await listRepository.updateProject();
                await listRepository.createVersion();
                await listRepository.createDeplyment();
              },
              text: 'tudo',
            ),
          ],
        ),
      ),
    );
  }
}

class TT extends StatelessWidget {
  final String text;
  final Function function;

  const TT({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Container(
          height: 100,
          width: double.infinity,
          color: Colors.blue,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
