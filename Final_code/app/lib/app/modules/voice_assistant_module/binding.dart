import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';

import 'logic.dart';

class VoiceAssistantModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationLogic());
    Get.lazyPut(() => AppController());

    Get.lazyPut(() => VoiceAssistantModuleLogic());


  }
}
