import 'package:app/app/data/model/user.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class SettingsMoudleLogic extends GetxController {
  final SettingsMoudleState state = SettingsMoudleState();

  static String SETTINGS = "用户设置";

  static String BINDINGS = "绑定账号";

  void toSettings() {
    state.title.value = SETTINGS;
    update();
  }

  void toCheckBindingAccount() {
    state.title.value = BINDINGS;

    update();
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    final _appController = Get.find<AppController>();
    _appController.actionSocket.close();
    _appController.userModel = UserModel();
    _appController.friendList = [];
    //关闭socket连接
    // _appController
    Get.offAndToNamed(Routes.LOGIN);
  }
}
