import 'package:get/get.dart';

import 'logic.dart';

class BusModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusModuleLogic());
  }
}
