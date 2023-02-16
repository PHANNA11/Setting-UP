import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FontController extends GetxController {
  RxString fontTheme = 'DancingScript'.obs;
  RxList<String> listFont =
      ['DancingScript', 'Domine', 'Pacifico', 'Kalam'].obs;
  changeFontThem(RxString fontUse) async {
    fontTheme = fontUse;
    update();
  }
}
