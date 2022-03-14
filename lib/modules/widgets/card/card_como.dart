import 'package:flutter/material.dart';

class CardComo extends StatelessWidget {
  final String como;
  const CardComo({
    Key? key,
    required this.como,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
      height: 30,
      alignment: Alignment.centerLeft,
      child: Text(
        como,
      ),
    );
    ;
  }
}
