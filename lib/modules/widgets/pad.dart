import 'package:flutter/material.dart';

class Pad extends StatelessWidget {
  final List<Widget> widgets;
  const Pad({
    Key? key,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
