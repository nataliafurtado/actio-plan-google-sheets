import 'package:flutter/material.dart';
import 'package:google_action_plan/modules/list/presentation/filter/widgets/filter_chips_responsable.dart';
import 'package:google_action_plan/modules/list/presentation/filter/widgets/log_out.dart';

import 'widgets/filter_chips_status.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const FilterChipsStatus(),
                  Container(width: 16),
                  const FilterChipsResponsable(),
                  Container(width: 8),
                ],
              ),
            ),
            const LogOut(),
          ],
        ),
      ),
    );
  }
}
