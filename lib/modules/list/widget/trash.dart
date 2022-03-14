import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.atrasada,
      alignment: const Alignment(0.9, 0),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
