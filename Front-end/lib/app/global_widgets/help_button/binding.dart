import 'package:get/get.dart';

import 'logic.dart';

class HelpButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpButtonLogic());
  }
}
