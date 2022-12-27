import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/global_widgets/error_dialog/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_widgets/success_dialog/view.dart';
import 'state.dart';

class LoginModuleLogic extends GetxController {
  final LoginModuleState state = LoginModuleState();

  void quickLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    if (token == null) {
      if (state.context == null) return;
      ErrorDialogComponent(context: state.context!, title: "请至少登录一次再使用此功能", btnOkOnPress: () {}).show();
    }
    ApiProvider.tokenLogin(token!).then((resp) {
      if (resp.body["success"]) {
        sp.setString("token", resp.body["token"]);
        Get.find<AppController>().initApp();
        if (state.context == null) return;
        SuccessDialogComponent(
                context: state.context!, title: "登录成功", btnOkOnPress: () => Get.offAndToNamed("voice_assistant"))
            .show()
            .then((value) => Get.offAndToNamed(Routes.VOICE_ASSISTANT));
      } else {
        if (state.context == null) return;
        ErrorDialogComponent(context: state.context!, title: '${resp.body["message"]}').show();
      }
    });
  }

  void changeAgree() {
    state.agree = !state.agree;
    update(["agree"]);
  }
}
