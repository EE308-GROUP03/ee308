import 'package:get/get.dart';

import 'logic.dart';

class PoliceButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoliceButtonLogic());
  }
}
