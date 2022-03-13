import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/modules/action/action_controller.dart';

class DropDownStatus extends StatefulWidget {
  const DropDownStatus({Key? key}) : super(key: key);

  @override
  _DropDownStatusState createState() => _DropDownStatusState();
}

class _DropDownStatusState extends State<DropDownStatus> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ActionController>();
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: statusColors(controller.selectedStatus),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: DropdownButton<String>(
        items: [
          'EM PROGRESSO',
          'EM ESPERA',
          'ATRASADA',
          "COMPLETA",
          "CANCELADA"
        ].map((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Container(
                width: flexWidthSpacing(context, 1) - 100,
                alignment: Alignment.center,
                child: Text(
                  val,
                  style: Style.bold,
                )),
          );
        }).toList(),
        value: controller.selectedStatus,
        underline: Container(color: Colors.transparent),
        onChanged: (newVal) {
          controller.selectedStatus = newVal!;
          this.setState(() {});
        },
      ),
    );
  }
}
