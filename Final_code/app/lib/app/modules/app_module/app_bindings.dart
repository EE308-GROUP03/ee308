import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => BottomNavigationLogic());
  }
}