import 'package:get/get.dart';

import 'logic.dart';

class SettingsMoudleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsMoudleLogic());
  }
}
