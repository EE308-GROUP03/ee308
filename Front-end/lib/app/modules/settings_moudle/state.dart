import 'package:get/get.dart';

class SettingsMoudleState {
  var title = "用户设置".obs;
  var arrowBackFun = () {
    Get.back();
  }.obs;

  SettingsMoudleState() {
    ///Initialize variables
  }
}
