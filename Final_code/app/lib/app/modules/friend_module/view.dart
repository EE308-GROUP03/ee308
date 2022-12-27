import 'package:app/app/data/model/friend.dart';
import 'package:app/app/utils/action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import 'logic.dart';

class FriendModulePage extends StatelessWidget {
  final FriendModel data = Get.arguments as FriendModel;

   FriendModulePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    Get.put(FriendModuleLogic());
    final logic = Get.find<FriendModuleLogic>();
    final state = Get.find<FriendModuleLogic>().state;


    return Container(
        color: Colors.white,
        child: SafeArea(
            child: GetBuilder<FriendModuleLogic>(
                builder: (controller) => Scaffold(
                    body: Stack(children: [
                      Positioned(left: 0, top: 0, child: _relativeTopBar()),
                      Positioned(
                          left: 194.w,
                          top: 92.h + 147.h,
                          child: _relativeRequestHelpText()),
                      Positioned(left: 0, top: 357.64.h, child: _relativeBox()),
                      Positioned(
                          left: 0,
                          top: 622.64.h,
                          child: Container(
                              width: 636.w,
                              height: 554.h,
                              child: Column(
                                  children: state.helping
                                      ? [
                                    _relativeHelpItem(ActionEnum.TAKE_TAXI),
                                    _relativeHelpItem(ActionEnum.TAKE_BUS),
                                    _relativeHelpItem(ActionEnum.TAKE_SUBWAY),
                                    _relativeHelpItem(ActionEnum.POLICE),
                                    _relativeHelpItem(ActionEnum.REALTIME_MAP)
                                  ]
                                      : [_relativeHelpItemStart()]))),
                    ])))));
  }

  //亲属界面顶部栏位
  Widget _relativeTopBar() {
    return Container(
      width: 637.w,
      height: 147.h,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: Offset(0, 3), color: Colors.black, blurRadius: 10)
      ]),
      child: Stack(alignment: Alignment.center, children: [
        Text(
          "远程协助",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 32.sp, letterSpacing: 3),
        ),
        Positioned(
            left: 30.w,
            child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset("assets/images/bus_drow_down.png",
                    width: 50.w, height: 50.w))),
      ]),
    );
  }

// 请求帮助文本
  Widget _relativeRequestHelpText() {
    return SizedBox(
        width: 249.w,
        height: 70.h,
        child: Column(children: [
          Text("正在求助",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp)),
          Text("请求对方远程控制手机", style: TextStyle(fontSize: 20.sp))
        ]));
  }

// 打开的界面的亲属信息
  Widget _relativeBox() {
    return SizedBox(
        width: 1.sw,
        height: 218.h,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                  child: Image.network(data.avatar??"",
                      width: 100.w,
                      height: 100.w,
                      errorBuilder: (context, _, __) => Image.asset(
                          "assets/images/logo1.png",
                          width: 100.w,
                          height: 100.w))),
              Text(data.mark??"无",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp)),
              Container(
                child:
                Text(data.nickname??"无", style: TextStyle(fontSize: 23.sp)),
              )
            ]));
  }

  Widget _relativeHelpItemStart() {
    final _logic = Get.find<FriendModuleLogic>();
    return Container(
        height: 110.h,
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            border: Border(
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.8),
                    width: 1,
                    style: BorderStyle.solid))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 0.5.sw,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("请求帮助",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.sp,
                                wordSpacing: 1)),
                        Text("请求对方远程协助",
                            style: TextStyle(fontSize: 20.sp, wordSpacing: 1))
                      ])),
              InkWell(
                  onTap: () => _logic.startHelp(),
                  child: Container(
                      width: 100.w,
                      height: 42.h,
                      constraints: BoxConstraints(maxWidth: 140.w),
                      decoration: BoxDecoration(
                        color: CustomColor.get("main"),
                        borderRadius: BorderRadius.circular(21.h),
                      ),
                      child: Center(
                          child: Text("发起",
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white)))))
            ]));
  }

  Widget _relativeHelpItem(String action) {
    final _logic = Get.find<FriendModuleLogic>();
    return Container(
        height: 110.h,
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            border: Border(
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.8),
                    width: 1,
                    style: BorderStyle.solid))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 0.5.sw,
                  child: Text(ActionEnum.actions[action]!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          wordSpacing: 1))),
              InkWell(
                  onTap: () =>
                      _logic.helpYourMother(action, data.id.toString()),
                  child: Container(
                      width: 100.w,
                      height: 42.h,
                      constraints: BoxConstraints(maxWidth: 140.w),
                      decoration: BoxDecoration(
                          color: CustomColor.get("main"),
                          borderRadius: BorderRadius.circular(21.h)),
                      child: Center(
                          child: Text("下一步",
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white)))))
            ]));
  }
}
