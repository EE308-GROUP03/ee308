import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginAgreePolicyHintDialog extends StatelessWidget {
  const LoginAgreePolicyHintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 495.w,
            height: 271.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              //提示框 路橙logo
              Positioned(
                  left: 195.17.w,
                  child: Image.asset("assets/images/login_orange_1_3.png",
                      width: 106.07.w, height: 133.97.h)),
              //用户同意提示
              Positioned(
                  top: 126.83.h,
                  child: SizedBox(
                      width: 495.w,
                      child: Text("请先勾选同意服务协议和隐私政策",
                          style: TextStyle(
                              fontSize: 26.sp,
                              color: Colors.black,
                              letterSpacing: 3),
                          textAlign: TextAlign.center))),
              Positioned(
                  top: 191.38.h,
                  left: 178.2.w,
                  child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                          width: 141.43.w,
                          height: 58.67.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF5C00),
                              borderRadius: BorderRadius.circular(29.335.h)),
                          child: Center(
                              child: Text("确认",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold))))))
            ])));
  }
}
