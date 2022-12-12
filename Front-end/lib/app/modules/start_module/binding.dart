import 'package:get/get.dart';

import 'logic.dart';

class StartModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartModuleLogic());
  }
}
