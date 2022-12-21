import 'package:app/app/global_widgets/outline_font/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/modules/login_module/logic.dart';
import 'package:app/app/modules/login_phone_module/local_widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import 'logic.dart';

class LoginPhoneModulePage extends StatelessWidget {
  const LoginPhoneModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _barHeight = 115.h;
    return SafeArea(child: Scaffold(body: GetBuilder<LoginModuleLogic>(builder: (controller) {
      return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 0.3],
                  colors: [Color.fromARGB(255, 228, 214, 189), Colors.white])),
          child: Stack(children: [
            // 加载完毕后显示左上方logo
            Positioned(
                top: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: _barHeight,
                    child: Center(
                        child: Row(children: [
                      Image.asset("assets/images/logo2.png",
                          width: _barHeight / 3, height: _barHeight / 3, fit: BoxFit.cover),
                      Image.asset("assets/images/font_logo.png", height: _barHeight / 4, fit: BoxFit.fitHeight)
                    ])))),
            //登录表单
            Positioned(
                top: _barHeight,
                child: Container(
                    width: 1.sw,
                    height: 1.sh - ScreenUtil().bottomBarHeight - ScreenUtil().statusBarHeight - _barHeight,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)), color: Colors.white),
                    child: _buildLoginForm()))
          ]));
    })));
  }

  Widget _buildLoginForm() {
    final _logic = Get.find<LoginPhoneModuleLogic>();
    final _state = _logic.state;
    return Stack(alignment: Alignment.center, children: [
      // 登录卡片倒三角
      Positioned(
          top: -10,
          child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.topCenter,
              onPressed: () {
                Get.back();
              },
              icon: Text(String.fromCharCode(0xf577),
                  style: TextStyle(
                      fontFamily: 'MaterialIcons',
                      fontSize: 90.sp,
                      color: CustomColor.get("main"),
                      shadows: const [Shadow(color: Colors.black, blurRadius: 10)])))),
      //橘子卡通图像
      Positioned(
          top: 50,
          child: Container(
              width: 1.sw,
              height: 200.h,
              // color: Colors.grey,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    top: 0,
                    right: 0.23.sw,
                    child: Image.asset("assets/images/logo1.png", height: 200.h, fit: BoxFit.fitHeight))
              ]))),
      //手机号和验证码
      Positioned(
          top: 50 + 200.h + 40.h,
          child: SizedBox(
              height: 200.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                LoginPhoneInputField(
                    placeHolder: "请 输 入 手 机 号", iconData: Icons.person, controller: _state.phoneNumber),
                LoginPhoneInputField(placeHolder: "请 输 入 短 信 验 证 码", iconData: Icons.lock, controller: _state.authCode)
              ]))),
      //同意用户条约
      Positioned(
          top: 50 + 200.h + 40.h + 200.h + 45.h,
          // left: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GetBuilder<LoginModuleLogic>(
                id: "agree",
                builder: (controller) => Checkbox(
                    value: controller.state.agree,
                    onChanged: (v) => {controller.changeAgree()},
                    shape: const CircleBorder())),
            RichText(
                text: TextSpan(
                    text: "我已经同意路橙的",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 3,
                        fontSize: 22.sp,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: "用户服务协议",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: const Color(0xffff5c00))),
                      TextSpan(
                          text: "以及",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.black)),
                      TextSpan(
                          text: "隐私政策",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: const Color(0xffff5c00)))
                    ]),
                textDirection: TextDirection.ltr)
          ])),
      Positioned(
          bottom: 280.h,
          child: CupertinoButton(
            child: Container(
              height: 80.h,
              width: 150.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black),
                  color: CustomColor.get("main"),
                  borderRadius: BorderRadius.circular(10)),
              child: OutlineFontComponent(text: "获取验证码", size: 23.sp),
            ),
            onPressed: () => _logic.getAuthCode(),
          )),
      //登录按钮
      Positioned(
          bottom: 190.h,
          child: CupertinoButton(
            child: Container(
              height: 71.h,
              width: 175.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black),
                  color: CustomColor.get("main"),
                  borderRadius: BorderRadius.circular(10)),
              child: OutlineFontComponent(text: "登 录", size: 35.sp),
            ),
            onPressed: () => _logic.phoneLogin(),
          )),
      //登录与快捷登录分割线
      Positioned(
          bottom: 135.h,
          child: SizedBox(
              width: 1.sw,
              height: 25.h,
              child: Row(children: [
                const Expanded(child: Divider(indent: 2, thickness: 2)),
                Expanded(child: Center(child: Text(" 切换为微信登录 ", style: TextStyle(fontSize: 20.sp, wordSpacing: 0.5)))),
                const Expanded(child: Divider(endIndent: 2, thickness: 2))
              ]))),
      //快捷微信登录按钮
      Positioned(
          bottom: 20.h,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 207, 84), borderRadius: BorderRadius.circular(20.h)),
              width: 80.h,
              height: 80.h,
              child: Center(child: Icon(Icons.wechat, color: Colors.white, size: 70.h))))
    ]);
  }
}
