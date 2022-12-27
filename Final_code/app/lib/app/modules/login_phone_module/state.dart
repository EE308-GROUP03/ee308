import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPhoneModuleState {
  late int sendTime;
  late TextEditingController phoneNumber;
  late TextEditingController authCode;
  BuildContext? context;
  // GlobalKey
  LoginPhoneModuleState() {
    ///Initialize variables
    sendTime = 0;
    context = Get.context;
    phoneNumber = TextEditingController();
    authCode = TextEditingController();
    phoneNumber.text="13105965306";
    authCode.text="000000";
  }
}
