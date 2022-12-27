import 'package:app/app/global_widgets/bottom_navigation/view.dart';
import 'package:app/app/global_widgets/help_button/view.dart';
import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:app/app/global_widgets/top_logo/view.dart';
import 'package:app/app/modules/mine_module/local_widgets/friend_list.dart';
import 'package:app/app/modules/mine_module/local_widgets/option_list.dart';
import 'package:app/app/modules/mine_module/local_widgets/user_info_box.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import 'logic.dart';

class MineModulePage extends StatelessWidget {
  const MineModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MineModuleLogic>();
    final state = Get.find<MineModuleLogic>().state;
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(children: [
                  //左上方路橙logo
                  Positioned(
                    child: const TopLogoComponent(),
                    top: 24.h,
                    left: 25.w
                  ),
                  // 右上方请求协助按钮
                  Positioned(
                    child: const HelpButtonComponent(),
                    top: 40.h,
                    left: 353.w
                  ),
                  //用户信息
                  Positioned(left: 51.w, top: 124.h, child: MineUserInfoBox(userModel: state.userModel)),
                  Positioned(
                      left: 118.w,
                      top: 204.h,
                      child: Image.asset("assets/images/mine_add_small.png", width: 20.w, height: 20.h)),
                  // 用户设置
                  Positioned(
                      left: 413.w,
                      top: 124.h,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.SETTINGS),
                        child: SizedBox(
                            width: 190.w,
                            height: 100.h,
                            child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.h), border: Border.all(width: 3)),
                                    width: 151.w,
                                    height: 56.h,
                                    child: const Center(child: Text("用户设置"))))),
                      )),
                  //我的亲友团 文本
                  Positioned(
                      left: 47.w,
                      top: 296.h,
                      child: Text("我的亲友团",
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 28.sp))),
                  //我的亲友团
                  Positioned(left: 52.w, top: 337.h, child: const MineFriendList()),

                  //共享定位给亲友团文本
                  Positioned(
                      left: 47.w,
                      top: 535.h,
                      child: Text("共享定位给亲友团",
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 28.sp))),
                  //共享位置开关
                  Positioned(
                      left: 493.w,
                      top: 525.32.h,
                      child: CupertinoSwitch(
                        onChanged: (value) => {},
                        value: false,
                      )),

                  Positioned(left: 49.w, top: 606.h, child: const MineOptionList()),
                  //一键报警按钮
                  Positioned(child: const PoliceButtonComponent(), left: 376.w, bottom: 200.h),
                  // 底部导航栏
                  Positioned(child: BottomNavigationComponent(), bottom: 0)
                ]))));
  }
}
