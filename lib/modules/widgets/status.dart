import 'package:flutter/material.dart';

import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/functions/functions.dart';

class ActionStatus extends StatelessWidget {
  final String text;
  const ActionStatus(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: flexWidthSpacing(context, 1),
      decoration: BoxDecoration(
        color: statusColors(text),
      ),
      child: Center(
        child: Text(
          text,
          style: Style.white,
        ),
      ),
    );
  }
}
