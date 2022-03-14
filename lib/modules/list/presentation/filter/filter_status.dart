import 'package:google_action_plan/data/models/action.dart';

class FilterStatus {
  static List<ActionEvent> fiter(
      List<ActionEvent> actionsNotFiltered, String statusPassed) {
    List<ActionEvent> actionsList = [];
    for (var i = 0; i < actionsNotFiltered.length; i++) {
      if (actionsNotFiltered[i].status!.toUpperCase() ==
          statusPassed.toUpperCase()) {
        actionsList.add(actionsNotFiltered[i]);
      }
    }
    return actionsList;
  }
}
