import 'package:get/get.dart';

import 'logic.dart';

class OutlineFontBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OutlineFontLogic());
  }
}
