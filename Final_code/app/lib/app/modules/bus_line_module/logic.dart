import 'package:get/get.dart';

import 'state.dart';

class BusLineModuleLogic extends GetxController {
  final BusLineModuleState state = BusLineModuleState();

  void reverse(){
    update();
  }
}
