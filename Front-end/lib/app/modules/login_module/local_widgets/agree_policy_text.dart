import 'package:app/app/modules/login_module/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginAgreePolicyText extends StatelessWidget {
  const LoginAgreePolicyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GetBuilder<LoginModuleLogic>(
              id: "agree",
              builder: (controller) => Checkbox(
                  value: controller.state.agree,
                  onChanged: (v) => controller.changeAgree(),
                  // {controller.changeAgree()},
                  shape: const CircleBorder())),
          RichText(
              text: TextSpan(
                  text: "我已经同意路橙的",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: Colors.black),
                  children: [
                    TextSpan(
                        text: "用户服务协议",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: const Color(0xffff5c00))),
                    TextSpan(
                        text: "以及",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: Colors.black)),
                    TextSpan(
                        text: "隐私政策",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: const Color(0xffff5c00))),
                    const TextSpan(text: "    ")
                  ]),
              textDirection: TextDirection.ltr)
        ]));
  }
}
