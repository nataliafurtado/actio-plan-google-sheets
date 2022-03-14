import 'package:google_action_plan/data/models/action.dart';

class FilterResponsable {
  static List<ActionEvent> fiter(
      List<ActionEvent> actionsNotFiltered, String responsablePassed) {
    List<ActionEvent> actionsList = [];
    for (var i = 0; i < actionsNotFiltered.length; i++) {
      if (actionsNotFiltered[i].quem!.toUpperCase() ==
          responsablePassed.toUpperCase()) {
        actionsList.add(actionsNotFiltered[i]);
      }
    }
    return actionsList;
  }
}
