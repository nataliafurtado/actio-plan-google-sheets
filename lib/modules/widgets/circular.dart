import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';

class Circular extends StatelessWidget {
  const Circular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          color: Style.primaryColor,
          backgroundColor: Style.secondaryColor,
        ),
      ),
    );
  }
}
