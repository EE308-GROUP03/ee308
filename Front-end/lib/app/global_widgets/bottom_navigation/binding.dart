import 'package:get/get.dart';

import 'logic.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationLogic());
  }
}
