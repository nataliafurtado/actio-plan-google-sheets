import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_action_plan/config/style.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final Color? color;
  final IconData? icon;
  const Button(
    this.text,
    this.onClick, {
    Key? key,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 56,
        decoration: Style.buttonDecoration(color: color),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Style.white,
            ),
            if (icon != null) const SizedBox(width: 15),
            if (icon != null)
              FaIcon(
                icon,
                color: Style.secondaryColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
