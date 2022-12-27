import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:app/app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SettingsModulePage extends StatelessWidget {
  const SettingsModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SettingsMoudleLogic>();
    final state = Get.find<SettingsMoudleLogic>().state;

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: Stack(children: [
          Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 637.w,
                height: 147.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(offset: Offset(0, 3), color: Colors.black, blurRadius: 10)]),
                child: Stack(alignment: Alignment.center, children: [
                  Obx(() => Text(logic.state.title.value,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp, letterSpacing: 3))),
                  Positioned(
                      left: 30.w,
                      child:GetBuilder<SettingsMoudleLogic>(
                        builder: (_logic) {
                          return GestureDetector(
                              onTap: () {
                                String _curPage = _logic.state.title.value;
                                if (_curPage == SettingsMoudleLogic.SETTINGS) {
                                  Get.back();
                                } else {
                                  _logic.toSettings();
                                }
                              },
                              child: Image.asset("assets/images/bus_drow_down.png", width: 50.w, height: 50.w));
                        }
                      )),
                ]),
              )),
          Positioned(
              left: 38.h,
              top: 194.98.h,
              child: GetBuilder<SettingsMoudleLogic>(
                builder: (_logic) {
                  String _curPage = _logic.state.title.value;
                  if (_curPage == SettingsMoudleLogic.SETTINGS) {
                    return _settings();
                  } else {
                    return _checkBindingAccount();
                  }
                },
              )),
          Positioned(
              left: 38.w,
              top: 657.98.h,
              child: GetBuilder<SettingsMoudleLogic>(
                builder: (_logic) {
                  String _curPage = _logic.state.title.value;
                  if (_curPage == SettingsMoudleLogic.SETTINGS) {
                    return GestureDetector(
                      onTap: ()=>_logic.logOut(),
                      child: Container(
                          width: 562.w,
                          height: 133.h,
                          decoration:
                              BoxDecoration(color: CustomColor.get("main"), borderRadius: BorderRadius.circular(25.h)),
                          child: Center(
                              child: Text("退出当前账号",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 36.sp,
                                      letterSpacing: 2)))),
                    );
                  } else {
                    return Container();
                  }
                },
              )),
          Positioned(child: const PoliceButtonComponent(), left: 376.w, bottom: 200.h),
        ]))));
  }

  Widget _settings() {    final logic = Get.find<SettingsMoudleLogic>();

  return SizedBox(
        width: 562.w,
        height: 326.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap:()=>logic.toCheckBindingAccount() ,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                width: 562.w,
                height: 151.h,
                decoration: BoxDecoration(border: Border.all(width: 5)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("绑定账号", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, letterSpacing: 3)),
                  SizedBox(
                      width: 160.w,
                      height: 151.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("查看已绑定账号", style: TextStyle(fontSize: 18.sp)),
                            Icon(Icons.arrow_forward_ios_rounded, size: 30.w, color: Colors.orange)
                            // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded,size: 20.w,))
                          ]))
                ])),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              width: 562.w,
              height: 151.h,
              decoration: BoxDecoration(border: Border.all(width: 5)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("规则中心", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, letterSpacing: 3)),
                SizedBox(
                    width: 160.w,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Container(width: 1),
                      Container(width: 1),
                      Icon(Icons.arrow_forward_ios_rounded, size: 30.w, color: Colors.orange)
                      // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded,size: 20.w,))
                    ]))
              ]))
        ]));
  }

  Widget _checkBindingAccount() {
    return SizedBox(
        width: 562.w,
        height: 326.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              width: 562.w,
              height: 151.h,
              decoration: BoxDecoration(border: Border.all(width: 5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("绑定手机号", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, letterSpacing: 3)),
                  Text("131****5306")
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              width: 562.w,
              height: 151.h,
              decoration: BoxDecoration(border: Border.all(width: 5)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("绑定微信账号", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, letterSpacing: 3)),
                Text("alskdjalksdj")
              ]))
        ]));
  }
}
