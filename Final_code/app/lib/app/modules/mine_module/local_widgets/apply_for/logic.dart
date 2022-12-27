import 'package:app/app/data/model/user.dart';
import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/global_widgets/error_dialog/view.dart';
import 'package:app/app/global_widgets/success_dialog/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/modules/mine_module/logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class ApplyForLogic extends GetxController {
  final ApplyForState state = ApplyForState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search();
  }

  @override
  void onClose() {
    state.phone.removeListener(() {});
    state.phone.dispose();
    state.mark.dispose();
    super.onClose();
  }

  void search() {
    state.phone.addListener(() async {
      if (state.phone.text.length == 11) {
        await ApiProvider.getFriend("phone", state.phone.text).then((resp) {
          if (resp.body["success"]) {
            state.userModel.fromJson(resp.body["friend"]);
            state.find = true;
            update();
          }
        });
      }
    });
  }

  Future sendRequest() async {
    if (state.phone.text.length != 11 || state.mark.text.isEmpty) return;

    Response resp = await ApiProvider.addFriend(1, "phone", state.phone.text, state.mark.text);
    BuildContext? context;
    while (context == null) {
      context = Get.context;
    }

    if (resp.body["success"]) {
      SuccessDialogComponent(context: context, title: "好友申请成功").show().then((value) {
        Get.back();
        Get.find<MineModuleLogic>().userUpdate();
      });
    } else {
      ErrorDialogComponent(context: context, title: resp.body["message"]).show();
    }
  }
}
