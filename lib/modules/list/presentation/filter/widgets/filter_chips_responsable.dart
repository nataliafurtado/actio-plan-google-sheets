import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';
import 'package:google_action_plan/modules/widgets/chips_filter.dart';

class FilterChipsResponsable extends StatefulWidget {
  const FilterChipsResponsable({Key? key}) : super(key: key);

  @override
  _FilterChipsResponsableState createState() => _FilterChipsResponsableState();
}

class _FilterChipsResponsableState extends State<FilterChipsResponsable> {
  late ListController controllerList;
  @override
  Widget build(BuildContext context) {
    controllerList = GetIt.I.get<ListController>();
    return ChipsFilter(
      textDefault: controllerList.selectedResponsable,
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
                itemCount: controllerList.responsables.length + 1,
                itemBuilder: (ctx, index) {
                  return index == controllerList.responsables.length
                      ? ListTile(
                          leading: const Icon(Icons.not_interested),
                          title: const Text('Todas'),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterResponsableCleanFilter();
                          },
                        )
                      : ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                              controllerList.responsables[index].toUpperCase()),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterResponsableActions(
                                controllerList.responsables[index]);
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
