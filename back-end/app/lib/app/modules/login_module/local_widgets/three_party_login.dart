import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginThreePartyLogin extends StatelessWidget {
  const LoginThreePartyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 424.w,
        height: 120.h,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                print("click");
                Get.toNamed(Routes.LOGIN_PHONE);
              },
              child: Image.asset("assets/images/login_phone.png",
                  height: 120.h, width: 120.h)),
          GestureDetector(
              onTap: () => print("ok"),
              child: Image.asset("assets/images/login_wechat.png",
                  height: 120.h, width: 120.h))
        ]));
  }
}
