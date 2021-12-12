import 'package:flutter/material.dart';

import 'package:google_action_plan/config/style.dart';

class ChipsFilter extends StatefulWidget {
  final String textDefault;
  final String? textSelected;
  final Function onClick;
  final double width;
  const ChipsFilter({
    Key? key,
    required this.textDefault,
    this.textSelected,
    required this.onClick,
    required this.width,
  }) : super(key: key);
  @override
  _ChipsFilterState createState() => _ChipsFilterState();
}

class _ChipsFilterState extends State<ChipsFilter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick(context);
      },
      child: Container(
        // width: widget.width ?? 120,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Style.primaryColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Text(
                widget.textSelected ?? widget.textDefault,
                maxLines: 1,
                style: TextStyle(
                  color: Style.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.sort,
              size: 20,
              color: Style.secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}
