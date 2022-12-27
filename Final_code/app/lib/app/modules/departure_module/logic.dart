import 'package:app/app/modules/departure_module/local_widgets/dialog.dart';
import 'package:get/get.dart';

import 'state.dart';

class DepartureModuleLogic extends GetxController {
  final DepartureModuleState state = DepartureModuleState();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Get.dialog(const DepartureHintWidget());
  }
}
