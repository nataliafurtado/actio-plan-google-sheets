import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/generated/l10n.dart';
// import 'package:google_action_plan/modules/list/list_controller.dart';

class NewActionButton extends StatelessWidget {
  const NewActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // late ListController controllerList;
    // Provider.of<ListController>(context, listen: false);
    return InkWell(
      onTap: () {
        // controllerList.goToNewActionEventPage();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        height: 60,
        color: Style.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).NOVA_ACAO,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(width: 30),
            const Icon(Icons.add_circle, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
