import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_action_plan/config/style.dart';

class LoginDevelopedBy extends StatelessWidget {
  const LoginDevelopedBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Desenvolvido por Natália Furtado",
            style: Style.cardSubTitle.copyWith(fontSize: 10),
          ),
          Container(width: 3),
          FaIcon(
            FontAwesomeIcons.transgenderAlt,
            color: Style.primaryColor.withOpacity(0.5),
            size: 12,
          ),
        ],
      ),
    );
  }
}
