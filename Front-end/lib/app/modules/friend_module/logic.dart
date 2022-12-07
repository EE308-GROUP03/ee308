import 'dart:convert';

import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';

import 'state.dart';

class FriendModuleLogic extends GetxController {
  final FriendModuleState state = FriendModuleState();

  void startHelp() {
    state.helping = true;
    update();
  }

  void stopHelp() {
    state.helping = false;
    update();
  }

  void helpYourMother(String actionType, String fid) {
    final _controller = Get.find<AppController>();
    var info = {"uid": _controller.userModel.id.toString(), "fid": fid, "action_type": actionType};
    _controller.actionSocket.send(jsonEncode(info));
  }
}
