import 'package:app/app/data/model/user_param.dart';
import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/global_widgets/success_dialog/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global_widgets/error_dialog/view.dart';
import 'state.dart';

class LoginPhoneModuleLogic extends GetxController {
  final LoginPhoneModuleState state = LoginPhoneModuleState();

  void getAuthCode() async {
    if (state.sendTime > 0) return;
    await ApiProvider.getAuthCode(state.phoneNumber.text);
    state.sendTime = 60;
    Future.delayed(const Duration(seconds: 60), () => state.sendTime = 0);
  }

  void phoneLogin() async {
    if (state.phoneNumber.text.length != 11 || state.authCode.text.length != 6) return;

    await ApiProvider.login(
            UserParam(identityType: "phone", identifier: state.phoneNumber.text, credential: state.authCode.text))
        .then((resp) async {
      if (resp.body["success"]) {
        await SharedPreferences.getInstance().then((sp) => sp.setString("token", resp.body["token"]));
        Get.find<AppController>().initApp();
        if (state.context == null) return;
        SuccessDialogComponent(
                context: state.context!, title: "登录成功", btnOkOnPress: () => Get.offAllNamed(Routes.VOICE_ASSISTANT))
            .show()
            .then((value) => Get.offAllNamed(Routes.VOICE_ASSISTANT));
      } else {
        if (state.context == null) return;
        ErrorDialogComponent(context: state.context!, title: '${resp.body["message"]}').show();
      }
    });
  }
}
