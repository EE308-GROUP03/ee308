import 'package:get/get.dart';

import 'logic.dart';

class ApplyForBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyForLogic());
  }
}
