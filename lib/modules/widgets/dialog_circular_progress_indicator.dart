import 'package:flutter/material.dart';

class DialogCircularProgressIndicator extends StatelessWidget {
  const DialogCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
