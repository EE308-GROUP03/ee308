import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/modules/login_module/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPhoneModuleBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut(() => LoginModuleLogic());
    Get.lazyPut(() => LoginPhoneModuleLogic());
    Get.lazyPut(() => AppController());

  }
}
