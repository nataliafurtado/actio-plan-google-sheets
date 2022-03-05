import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_action_plan/config/style.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final Function? logout;
  final Function? changePostCardModel;
  TitleWidget(
    this.text, {
    Key? key,
    this.logout,
    this.changePostCardModel,
  }) : super(key: key);

  final Widget spaceAux = Container(
    width: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          spaceAux,
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
            // style: Style.titleFont,
          ),
          logout == null
              ? spaceAux
              : InkWell(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      color: Style.primaryColor,
                      size: 15,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Style.primaryColor,
                    size: 25,
                  ),
                  title: const Text('Sair'),
                  onTap: () {
                    logout!(context);
                  }),
              if (changePostCardModel != null)
                ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.exchangeAlt,
                      color: Style.primaryColor,
                      size: 25,
                    ),
                    title: const Text('Mudar modelo do card de posts'),
                    onTap: () {
                      changePostCardModel!();
                    }),
            ],
          ),
        );
      },
    );
  }
}
