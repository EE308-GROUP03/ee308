import 'package:get/get.dart';

import 'logic.dart';

class ErrorDialogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ErrorDialogLogic());
  }
}
