import 'package:get/get.dart';

import 'logic.dart';

class TopLogoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopLogoLogic());
  }
}
