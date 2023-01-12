import 'package:google_action_plan/data/models/action.dart';

class FilterCategoria {
  static List<ActionEvent> fiter(
    List<ActionEvent> actionsNotFiltered,
    String strinTofilter,
  ) {
    List<ActionEvent> actionsList = [];
    for (var i = 0; i < actionsNotFiltered.length; i++) {
      if (actionsNotFiltered[i].categoria!.toUpperCase() ==
          strinTofilter.toUpperCase()) {
        actionsList.add(actionsNotFiltered[i]);
      }
    }
    return actionsList;
  }
}
