import 'package:app/app/modules/mine_module/local_widgets/apply_for/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MineModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineModuleLogic());
    Get.lazyPut(() => ApplyForLogic());
  }
}
