import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTopLeftLogo extends StatelessWidget {
  const LoginTopLeftLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 186.59.w,
        height: 100.h,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
              left: 58.w,
              bottom: 0,
              child: Image.asset("assets/images/login_range.png",
                  width: 140.w, height: 62.h)),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset("assets/images/login_o.png",
                  width: 55.w, height: 90.25.h)),
          Positioned(
              left: 0,
              bottom: 11.h,
              child: Image.asset("assets/images/login_frame_56.png",
                  width: 61.41.w, height: 54.15.h)),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset("assets/images/login_malu.png",
                  fit: BoxFit.fill, width: 227.w, height: 23.47.h))
        ]));
  }
}
