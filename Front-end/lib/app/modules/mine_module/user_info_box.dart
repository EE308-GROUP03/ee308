import 'package:app/app/data/model/user.dart';
import 'package:app/app/modules/mine_module/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MineUserInfoBox extends StatelessWidget {
  const MineUserInfoBox({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  // Text(userModel.nickname ?? "未知"),

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MineModuleLogic>();
    final state = logic.state;

    return SizedBox(
        width: 313.66.w,
        height: 100.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 100.h - 8,
                  height: 100.h - 8,
                  decoration: BoxDecoration(border: Border.all(width: 4), shape: BoxShape.circle),
                  child: ClipOval(
                      child: Image.network(userModel.avatar ?? "",
                          width: 100.h,
                          height: 100.h,
                          errorBuilder: (_, _1, _2) =>
                              Image.asset("assets/images/departure_hint_orange.png", width: 100.h, height: 100.h)))),
              SizedBox(
                  width: 150.w,
                  height: 100.h,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    autofocus: false,
                    focusNode: state.nicknameFocusNode,

                    decoration: const InputDecoration(

                        contentPadding: EdgeInsets.only(top: 0, bottom: 0), border: InputBorder.none),
                    controller: state.nickname..text = userModel.nickname ?? "未知用户",
                  )),
              GestureDetector(onTap: ()=>state.nicknameFocusNode.requestFocus(), child : Image.asset("assets/images/mine_pencil.png", width: 42.66.w, height: 50.h)),
            ]));
  }
}
