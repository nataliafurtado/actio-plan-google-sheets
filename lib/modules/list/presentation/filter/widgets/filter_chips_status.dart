import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';

import 'package:google_action_plan/modules/widgets/chips_filter.dart';

class FilterChipsStatus extends StatefulWidget {
  const FilterChipsStatus({Key? key}) : super(key: key);

  @override
  _FilterChipsStatusState createState() => _FilterChipsStatusState();
}

class _FilterChipsStatusState extends State<FilterChipsStatus> {
  late ListController controllerList;
  @override
  Widget build(BuildContext context) {
    controllerList = GetIt.I.get<ListController>();
    return ChipsFilter(
      textDefault: controllerList.selectedFilterStatus,
      width: 150,
      onClick: _statusFilter,
    );
  }

  void _statusFilter(
    context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: controllerList.status.length + 1,
                itemBuilder: (ctx, index) {
                  return index == controllerList.status.length
                      ? ListTile(
                          leading: const Icon(Icons.not_interested),
                          title: const Text('Todas'),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterStatusCleanFilter();
                          },
                        )
                      : ListTile(
                          leading: const Icon(Icons.label_important),
                          title:
                              Text(controllerList.status[index].toUpperCase()),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterStatusActions(
                                controllerList.status[index]);
                          },
                        );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
