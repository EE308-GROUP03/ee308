import 'package:get/get.dart';

import 'logic.dart';

class BusLineModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusLineModuleLogic());
  }
}
