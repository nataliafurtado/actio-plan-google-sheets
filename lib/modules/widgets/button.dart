import 'package:flutter/material.dart';

import 'package:google_action_plan/config/style.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const Button(
    this.text,
    this.onClick, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 56,
        decoration: Style.buttonDecoration,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Style.white,
        ),
      ),
    );
  }
}
