import 'package:flutter/material.dart';
import 'package:google_action_plan/config/style.dart';

// import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/modules/list/list_controller.dart';

class DatePickerPrazo extends StatefulWidget {
  const DatePickerPrazo({Key? key}) : super(key: key);

  @override
  _DatePickerPrazoState createState() => _DatePickerPrazoState();
}

class _DatePickerPrazoState extends State<DatePickerPrazo> {
  @override
  Widget build(BuildContext context) {
    // late ListController controllerList;
    // Provider.of<ListController>(context, listen: false);
    return InkWell(
      onTap: () {
        // _selectDate(context, controllerList);
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // color: controllerList.prazo.isEmpty
          //     ? Colors.indigo[100]
          //     : prazoColors(
          //         DateTime.parse(controllerList.prazo),
          //       ),
        ),
        alignment: Alignment.center,
        child: Text(
          '',
          // formatData(controllerList.prazo, true),
          style: Style.white,
        ),
      ),
    );
  }

  // ignore: unused_element
  _selectDate(BuildContext context, ListController controllerList) async {
    // ignore: unused_local_variable
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controllerList.prazo.isEmpty
          ? DateTime.now()
          : DateTime.parse(controllerList.prazo), // Refer step 1
      firstDate: DateTime.now().add(const Duration(days: -10)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    // if (picked != null)
    // setState(() {
    //   controllerList.prazo = picked.toIso8601String();
    // });
  }
}
