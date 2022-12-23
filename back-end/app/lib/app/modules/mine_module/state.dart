import 'package:app/app/data/model/user.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MineModuleState {
  late bool sharePos;
  late UserModel userModel;
  late TextEditingController nickname;
  late FocusNode nicknameFocusNode;

  MineModuleState() {
    ///Initialize variables
    final _appController = Get.find<AppController>();

    userModel = _appController.userModel;
    sharePos = false;
    nickname = TextEditingController();
    nicknameFocusNode = FocusNode();
  }
}
