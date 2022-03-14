import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';

class CardOque extends StatelessWidget {
  final String oque;
  final String quem;
  const CardOque({
    Key? key,
    required this.oque,
    required this.quem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ListController>();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            oque,
            style: Style.bold,
          ),
          Observer(
            builder: (_) {
              return controller.isToShowResponsable
                  ? Text(quem.toUpperCase())
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
