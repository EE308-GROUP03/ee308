import 'package:get/get.dart';

import 'logic.dart';

class SuccessDialogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessDialogLogic());
  }
}
