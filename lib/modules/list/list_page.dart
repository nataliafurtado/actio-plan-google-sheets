import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/list/widget/new_action_button.dart';
import 'package:google_action_plan/modules/list/widget/trash.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import 'package:google_action_plan/modules/widgets/card.dart';
import 'package:google_action_plan/modules/widgets/circular.dart';

import 'presentation/filter/filters.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ListController controllerList;
  @override
  void initState() {
    controllerList = GetIt.I.get<ListController>();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        controllerList.loadData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: Observer(
        builder: (_) {
          if (controllerList.listPageState == ListPageState.loading) {
            return const Circular();
          }

          return Column(
            children: [
              Container(height: 50),
              const Filters(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return controllerList.loadData();
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controllerList.actions.length + 1,
                    itemBuilder: (ctx, index) {
                      return index == controllerList.actions.length
                          ? const NewActionButton()
                          : Dismissible(
                              dismissThresholds: const {
                                DismissDirection.endToStart: 0.9
                              },
                              background: const Trash(),
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                controllerList.deleteactionEvent(index);
                              },
                              child: CardAction(
                                controllerList.actions[index],
                                index,
                              ),
                              confirmDismiss: dialogShouldDismiss,
                              movementDuration: const Duration(seconds: 1),
                            );
                    },
                  ),
                ),
              ),
              Container(height: 30),
            ],
          );
        },
      ),
    );
  }

  Future<bool> dialogShouldDismiss(DismissDirection direction) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Deseja excluir',
                  style: Style.bold,
                ),
                Container(height: 20),
                Button('Excluir', () {
                  Navigator.of(context).pop(true);
                }),
                Container(height: 20),
                Button('Cancelar', () {
                  Navigator.of(context).pop(false);
                }),
                Container(height: 20),
                const Text(
                  "*Esta ação não pode ser desfeita ",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
