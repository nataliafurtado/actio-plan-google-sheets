import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';

import 'package:google_action_plan/modules/widgets/chips_filter.dart';

class FilterChipsCategoria extends StatefulWidget {
  const FilterChipsCategoria({Key? key}) : super(key: key);

  @override
  _FilterChipsCategoriaState createState() => _FilterChipsCategoriaState();
}

class _FilterChipsCategoriaState extends State<FilterChipsCategoria> {
  late ListController controllerList;
  @override
  Widget build(BuildContext context) {
    controllerList = GetIt.I.get<ListController>();

    return Observer(
      builder: (_) {
        String t = controllerList.categoria;
        if (t.length > 10) {
          t = t.substring(1, 10);
        }
        return ChipsFilter(
          textDefault: t,
          width: 150,
          onClick: _filter,
        );
      },
    );
  }

  void _filter(
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
                itemCount: controllerList.categorias.length + 1,
                itemBuilder: (ctx, index) {
                  return index == controllerList.categorias.length
                      ? ListTile(
                          leading: const Icon(Icons.not_interested),
                          title: const Text('Todas'),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterCategoriaCleanFilter();
                          },
                        )
                      : ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            controllerList.categorias[index].toUpperCase(),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            controllerList.filterCategoriaActions(
                              controllerList.categorias[index],
                            );
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
