import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:get/get.dart';

import 'state.dart';

class CouponModuleLogic extends GetxController {
  final CouponModuleState state = CouponModuleState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final _appCtrl = Get.find<AppController>();
    ApiProvider.getPrivateInformation("balance", _appCtrl.userModel.id).then((resp) {
      if (resp.body["success"]) {
        // print(resp.body);
        state.balance = resp.body["data"];
        print( resp.body["data"]);
        print(state.balance);

      }
    }).onError((error, stackTrace) => null);
  }
}
