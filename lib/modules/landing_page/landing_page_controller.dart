import 'package:flutter/material.dart';
import 'package:google_action_plan/functions/functions.dart';
import 'package:google_action_plan/modules/widgets/dialog_circular_progress_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'landing_page_controller.g.dart';

class LandingPageController = LandingPageControllerBase
    with _$LandingPageController;

abstract class LandingPageControllerBase with Store, ChangeNotifier {
  //  ListRepository _listRepository = ListRepository();

  @observable
  int selectPageIndex = 0;
  @action
  nextPage() {
    selectPageIndex = selectPageIndex + 1;
  }

  @action
  lastPage() {
    selectPageIndex = selectPageIndex - 1;
  }

  checkIfAlreadyHasIDSetted(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("pa-app")) {
      // Provider.of<GlobalAccess>(context, listen: false).controllerIdSheet.text =
      //     prefs.getString("pa-app");
      // Navigator.popAndPushNamed(context, '/list-page');
    }
  }

  configureAndGoToList() async {
    showCustomDialog(const DialogCircularProgressIndicator());
    // saveId();
    // await _listRepository.doPost(ActionEvent(action: Constants.config));
    // Navigator.pop(context);
    // Navigator.popAndPushNamed(context, '/list-page');
  }

  Future saveId() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString(
    //     "pa-app",
    //     Provider.of<GlobalAccess>(context, listen: false)
    //         .controllerIdSheet
    //         .text);
  }
}
