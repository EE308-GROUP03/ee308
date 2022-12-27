import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';

import '../../global_widgets/bottom_navigation/logic.dart';
import 'logic.dart';

class DepartureModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => BottomNavigationLogic());
    Get.lazyPut(() => DepartureModuleLogic());
  }
}
