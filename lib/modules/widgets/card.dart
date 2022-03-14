import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/functions/functions.dart';

import 'package:google_action_plan/data/models/action.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';
import 'package:google_action_plan/modules/widgets/card/card_como.dart';
import 'package:google_action_plan/modules/widgets/card/card_oque.dart';

import 'status.dart';

class CardAction extends StatelessWidget {
  final ActionEvent action;
  final int index;
  const CardAction(
    this.action,
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ListController>();
    return InkWell(
      onTap: () {
        controller.goToEditActionEventPage(
          context: context,
          index: index,
        );
      },
      onLongPress: () {
        controller.changeShowResponsableInCard();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        height: 150,
        decoration: Style.cardDecoration,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatData(action.prazo!, true), style: Style.bold),
                  Text(action.categoria!.toUpperCase()),
                ],
              ),
            ),
            ActionStatus(action.status!),
            CardOque(
              oque: action.oQue!,
              quem: action.quem!,
            ),
            CardComo(como: action.como!),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
