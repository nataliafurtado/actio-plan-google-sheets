import 'package:flutter/material.dart';

import 'package:google_action_plan/config/style.dart';

class ImageTextWidget extends StatelessWidget {
  final String text;
  final String image;
  const ImageTextWidget({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 50),
        Text(
          text,
          style: Style.bold.copyWith(fontSize: 18),
        ),
        Container(height: 30),
        Image.asset(image),
      ],
    );
  }
}
