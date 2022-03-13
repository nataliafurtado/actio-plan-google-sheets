import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/modules/action/action_controller.dart';

class DatePickerPrazo extends StatefulWidget {
  const DatePickerPrazo({Key? key}) : super(key: key);

  @override
  _DatePickerPrazoState createState() => _DatePickerPrazoState();
}

class _DatePickerPrazoState extends State<DatePickerPrazo> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ActionController>();

    return InkWell(
      onTap: () {
        _selectDate(context, controller);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: controller.prazo.isEmpty
              ? Colors.indigo[100]
              : prazoColors(
                  DateTime.parse(controller.prazo),
                ),
        ),
        alignment: Alignment.center,
        child: Text(
          formatData(controller.prazo, true),
          style: Style.white,
        ),
      ),
    );
  }

  _selectDate(BuildContext context, ActionController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.prazo.isEmpty
          ? DateTime.now()
          : DateTime.parse(controller.prazo),
      firstDate: DateTime.now().add(const Duration(days: -10)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        controller.prazo = picked.toIso8601String();
      });
    }
  }
}
