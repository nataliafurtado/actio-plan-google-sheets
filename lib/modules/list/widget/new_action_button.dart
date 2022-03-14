import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';

class NewActionButton extends StatelessWidget {
  const NewActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetIt.I.get<ListController>().goToEditActionEventPage(context: context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        height: 60,
        color: Style.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nova ação",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(width: 30),
            const Icon(Icons.add_circle, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
