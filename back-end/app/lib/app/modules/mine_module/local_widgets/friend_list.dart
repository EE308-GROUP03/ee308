import 'package:app/app/modules/mine_module/local_widgets/apply_for/view.dart';
import 'package:app/app/modules/mine_module/local_widgets/friend_box.dart';
import 'package:app/app/modules/mine_module/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';
import '../../app_module/app_controller.dart';

class MineFriendList extends StatelessWidget {
  const MineFriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mainController = Get.find<AppController>();
    List<Widget> _list = [];
    for (var element in _mainController.friendList) {
      _list.add(MineFriendBox(friend: element));
    }
    _list.add(
      GestureDetector(
          child: ClipOval(
              child: Container(
                  width: 88.h,
                  height: 88.h,
                  color: Colors.white,
                  child: Icon(Icons.add,
                      color: CustomColor.get("main"), size: 88.h))),
          onTap: () => Get.dialog(ApplyForComponent())),
    );
    _list.add(
      const SizedBox(width: 30),
    );
    return GetBuilder<MineModuleLogic>(
        id: "relative-list",
        builder: (_logic) => Container(
            height: 144.h + 8,
            width: 532.w + 8,
            decoration: BoxDecoration(
                color: CustomColor.get("main"),
                border: Border.all(width: 4),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(6, 6),
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 2)
                ]),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _list))));
  }
}
