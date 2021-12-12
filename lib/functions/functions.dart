import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:intl/intl.dart';

import '../assets/constants.dart';
import '../services/navigator_sergice.dart';

Color statusColors(String status) {
  if (Constants.emProgresso == status.toUpperCase()) {
    return Style.emProgresso;
  } else if (Constants.atrasada == status.toUpperCase()) {
    return Style.atrasada;
  } else if (Constants.emEspera == status.toUpperCase()) {
    return Style.emEspera;
  } else if (Constants.cancelada == status.toUpperCase()) {
    return Style.cancelada;
  } else if (Constants.completa == status.toUpperCase()) {
    return Style.completa;
  }
  return Colors.white;
}

Color prazoColors(DateTime date) {
  if (date.isBefore(DateTime.now())) {
    return Style.atrasada;
  } else if (date.isAfter(DateTime.now())) {
    return Style.completa;
  } else {
    return Style.atrasada;
  }
}

double flexHeightSpacing(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double flexWidthSpacing(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

String formatData(String datePassed, bool returnSemPrazo) {
  if (datePassed.isNotEmpty) {
    DateTime brazilianDate = DateTime.parse(datePassed);
    return DateFormat('dd/MM/yyyy').format(brazilianDate);
  } else {
    return returnSemPrazo ? "Sem prazo" : "";
  }
}

void showCustomDialog(Widget dialog) {
  showDialog(
    context: NavigationService.getNavigator().currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

double calculateBottonButtonsBottonDistance(context, totalSizeOfAllWidgets) {
  if (MediaQuery.of(context).size.height < totalSizeOfAllWidgets) {
    return 30;
  } else {
    return MediaQuery.of(context).size.height - totalSizeOfAllWidgets;
  }
}
