import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/infrastructure/repositories_impl/list_repository.dart';
import 'package:google_action_plan/modules/login/login_controller.dart';
import 'package:google_action_plan/services/navigator_service.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        height: 40,
        alignment: Alignment.center,
        margin: const EdgeInsetsDirectional.only(end: 8),
        child: Icon(
          Icons.settings,
          color: Style.primaryColor,
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Style.primaryColor,
                ),
                title: const Text('Sair'),
                onTap: () async {
                  GetIt.I.get<LoginController>().makeLogout();
                  await GetIt.I.get<ListRepository>().removeProjectCache();
                  Navigator.popAndPushNamed(
                    NavigationService.getNavigator().currentContext!,
                    '/',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
