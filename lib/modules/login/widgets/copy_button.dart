import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/widgets/button.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool numberCopied = false;

  @override
  Widget build(BuildContext context) {
    return Button(
      numberCopied ? 'Número copiado' : 'Copie número do servidor aqui',
      () {
        Clipboard.setData(const ClipboardData(text: '280281413857'));
        setState(() {
          numberCopied = true;
        });
      },
      color: numberCopied ? Style.primaryColor.withOpacity(0.4) : null,
      icon: numberCopied ? FontAwesomeIcons.check : FontAwesomeIcons.copy,
    );
  }
}
