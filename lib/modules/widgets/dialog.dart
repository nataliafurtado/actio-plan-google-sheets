import 'package:flutter/material.dart';

class DialogTeste extends StatelessWidget {
  final String teste;
  const DialogTeste({
    Key? key,
    required this.teste,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Text(teste),
      ),
    );
  }
}
