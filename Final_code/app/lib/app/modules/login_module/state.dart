import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginModuleState {
  late bool agree;
  BuildContext? context;

  LoginModuleState() {
    agree = true;
    context = Get.context;
  }
}
