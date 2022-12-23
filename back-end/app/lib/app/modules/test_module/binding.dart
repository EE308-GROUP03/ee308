import 'package:get/get.dart';

import 'logic.dart';

class TestModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestModuleLogic());
  }
}
