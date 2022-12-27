import 'package:get/get.dart';

import 'logic.dart';

class CouponModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CouponModuleLogic());
  }
}
