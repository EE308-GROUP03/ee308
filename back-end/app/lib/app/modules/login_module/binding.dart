import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginModuleLogic());
    Get.lazyPut(() => AppController());
  }
}
