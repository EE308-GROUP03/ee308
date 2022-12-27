import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/modules/mine_module/local_widgets/to_coupon_hint_dialog.dart';
import 'package:get/get.dart';

import 'state.dart';

class MineModuleLogic extends GetxController {
  final MineModuleState state = MineModuleState();


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Get.dialog(toCouponHintDialogWidget());
  }
  void sharePosChange() {
    state.sharePos = !state.sharePos;
    update(["share-pos"]);
  }


  void userUpdate() async {
  //   final _mainCtrl = Get.find<AppController>();
  //
  //   await ApiProvider.getFriends(state.userModel.id).then((resp) {
  //     List<Map<String, dynamic>> list = [];
  //     resp.body["relative"]?.forEach(
  //           (relative) => list.add(Map<String, dynamic>.from(relative)),
  //     );
  //     _mainCtrl.user.relativeList = list;
  //    state.userModel = _mainCtrl.user;
  //     update(["relative-list"]);
  //     // print(user.relativeList.toString());
  //   });
  }
}
