import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

double x(double num) {
  return 1 * num;
}

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({Key? key}) : super(key: key);

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _ac1;

  final String ellipseL = "ellipseL";
  final String ellipseT = "ellipseT";
  final String ellipseAngle = "ellipseAngle";

  final String bottomL = "bottomL";
  final String bottomT = "bottomT";
  final String bottomW = "bottomW";
  final String bottomH = "bottomH";
  final String bottomColor = "bottomColor";

  final String lEyeT = "lEyeT";
  final String lEyeL = "lEyeL";
  final String rEyeL = "rEyeL";
  final String rEyeT = "rEyeT";

  //眼睛嘴巴所在框的宽度
  final String eyesW = "eyesW";

  //眼睛嘴巴所在框的高度
  final String eyesH = "eyesH";
  final String eyesT = "eyesT";
  final String eyesL = "eyesL";

  final String eyesSize = "eyesSize";
  final String eyesAngle = "eyesAngle";

  Cubic bizer1 = const Cubic(0.68, -0.92, 0.47, 1.76);
  Cubic bizer2 = const Cubic(0.88, -0.94, 0.1, 1.57);
  Cubic bizer3 = const Cubic(0.88, -0.94, 0.1, 1.57);
  Cubic bizer4 = const Cubic(0.88, -0.91, 0.1, 1.57);

  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _ac1 = AnimationController(vsync: this, duration: const Duration(milliseconds: 3920))
      ..addListener(() {
        setState(() {});
      });
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween(begin: 167.54.w, end: 96.58.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: ellipseL)
        .addAnimatable(
            animatable: Tween(begin: 96.58.w, end: 162.5.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: ellipseL)
        .addAnimatable(
            animatable: Tween(begin: 162.5.w, end: 283.85.w),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: ellipseL)
        .addAnimatable(
            animatable: Tween(begin: 283.85.w, end: 167.54.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: ellipseL)
        //=======================================
        .addAnimatable(
            animatable: Tween(begin: 134.43.h, end: 121.49.h),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: ellipseT)
        .addAnimatable(
            animatable: Tween(begin: 121.49.h, end: 135.69.h),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: ellipseT)
        .addAnimatable(
            animatable: Tween(begin: 135.69.h, end: 92.5.h),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: ellipseT)
        .addAnimatable(
            animatable: Tween(begin: 92.5.h, end: 134.43.h),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: ellipseT)
        //================================================

        .addAnimatable(
            animatable: Tween(begin: 0.0, end: 0.3),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: ellipseAngle)
        .addAnimatable(
            animatable: Tween(begin: 0.3, end: 0.0),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: ellipseAngle)
        .addAnimatable(
            animatable: Tween(begin: 0.0, end: 0.3),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: ellipseAngle)
        .addAnimatable(
            animatable: Tween(begin: 0.3, end: 0.0),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: ellipseAngle)
        //======================以下是bottomL==========================
        .addAnimatable(
            animatable: Tween(begin: 311.57.w, end: 260.02.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: bottomL)
        .addAnimatable(
            animatable: Tween(begin: 260.02.w, end: 311.57.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: bottomL)
        .addAnimatable(
            animatable: Tween(begin: 311.57.w, end: 455.62.w),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: bottomL)
        .addAnimatable(
            animatable: Tween(begin: 455.62.w, end: 311.57.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: bottomL)
        //===========================================
        .addAnimatable(
            animatable: Tween(begin: 332.12.h, end: 340.76.h),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: bottomT)
        .addAnimatable(
            animatable: Tween(begin: 340.76.h, end: 332.12.h),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: bottomT)
        .addAnimatable(
            animatable: Tween(begin: 332.12.h, end: 312.05.h),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: bottomT)
        .addAnimatable(
            animatable: Tween(begin: 312.05.h, end: 332.12.h),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: bottomT)
        //======================================
        .addAnimatable(
            animatable: Tween(begin: 119.93.w, end: 135.84.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: bottomW)
        .addAnimatable(
            animatable: Tween(begin: 135.84.w, end: 119.93.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: bottomW)
        .addAnimatable(
            animatable: Tween(begin: 119.93.w, end: 135.84.w),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: bottomW)
        .addAnimatable(
            animatable: Tween(begin: 135.84.w, end: 119.93.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: bottomW)
        //=============================
        .addAnimatable(
            animatable: ColorTween(begin: const Color(0xffFF6636), end: const Color(0xffFF7A00).withOpacity(.27)),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: bottomColor)
        .addAnimatable(
            animatable: ColorTween(begin: const Color(0xffFF7A00).withOpacity(.27), end: const Color(0xffFF6636)),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: bottomColor)
        .addAnimatable(
            animatable: ColorTween(begin: const Color(0xffFF6636), end: const Color(0xffFF7A00).withOpacity(.27)),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: bottomColor)
        .addAnimatable(
            animatable: ColorTween(begin: const Color(0xffFF7A00).withOpacity(.27), end: const Color(0xffFF6636)),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: bottomColor)
        //============================================================

        //============================================================
        .addAnimatable(
            animatable: Tween(begin: 18.42.w, end: 22.28.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: eyesSize)
        .addAnimatable(
            animatable: Tween(begin: 22.28.w, end: 17.31.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: eyesSize)
        .addAnimatable(
            animatable: Tween(begin: 17.31.w, end: 5.0),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: eyesSize)
        .addAnimatable(
            animatable: Tween(begin: 5.0, end: 18.42.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: eyesSize)
        //=========================================
        .addAnimatable(
            animatable: Tween(begin: 229.41.w, end: 139.18.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: lEyeL)
        .addAnimatable(
            animatable: Tween(begin: 139.18.w, end: 200.18.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: lEyeL)
        .addAnimatable(
            animatable: Tween(begin: 200.18.w, end: 359.72.w),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: lEyeL)
        .addAnimatable(
            animatable: Tween(begin: 359.72.w, end: 229.41.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: lEyeL)
        //=========================================
        .addAnimatable(
            animatable: Tween(begin: 284.21.w, end: 193.27.w),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: rEyeL)
        .addAnimatable(
            animatable: Tween(begin: 193.27.w, end: 254.32.w),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: rEyeL)
        .addAnimatable(
            animatable: Tween(begin: 254.32.w, end: 414.18.w),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: rEyeL)
        .addAnimatable(
            animatable: Tween(begin: 414.18.w, end: 284.21.w),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: rEyeL)

        //===========================================
        .addAnimatable(
            animatable: Tween(begin: 254.72.h, end: 230.32.h),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: lEyeT)
        .addAnimatable(
            animatable: Tween(begin: 230.32.h, end: 253.25.h),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: lEyeT)
        .addAnimatable(
            animatable: Tween(begin: 253.25.h, end: 185.78.h),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: lEyeT)
        .addAnimatable(
            animatable: Tween(begin: 185.78.h, end: 254.72.h),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: lEyeT)

        //===========================================
        .addAnimatable(
            animatable: Tween(begin:252.1.h, end: 222.31.h),
            from: const Duration(milliseconds: 10),
            to: const Duration(milliseconds: 810),
            curve: bizer1,
            tag: rEyeT)
        .addAnimatable(
            animatable: Tween(begin:222.31.h, end:254.12.h),
            from: const Duration(milliseconds: 860),
            to: const Duration(milliseconds: 1960),
            curve: bizer2,
            tag: rEyeT)
        .addAnimatable(
            animatable: Tween(begin: 254.12.h, end: 176.71.h),
            from: const Duration(milliseconds: 1970),
            to: const Duration(milliseconds: 2770),
            curve: bizer3,
            tag: rEyeT)
        .addAnimatable(
            animatable: Tween(begin: 176.71.h, end: 252.1.h),
            from: const Duration(milliseconds: 2820),
            to: const Duration(milliseconds: 3920),
            curve: bizer4,
            tag: rEyeT)
        .animate(_ac1);

    // _ac1.forward();
    _ac1.repeat(max: 1);
  }

  @override
  void dispose() {
    _ac1.clearListeners();
    _ac1.dispose();
    super.dispose();
  }

  double? bodyL;
  double? bodyT;
  late double bodyAngle;
  late double eyeAngle;
  double? lEyeTop;
  double? lEyeLeft;

  double? rEyeTop;
  double? rEyeLeft;

  double? eyeSize;

  @override
  Widget build(BuildContext context) {
    bodyL = sequenceAnimation[ellipseL].value;
    bodyT = sequenceAnimation[ellipseT].value;
    bodyAngle = sequenceAnimation[ellipseAngle].value;
    // eyeAngle = sequenceAnimation[eyesAngle].value;
    lEyeTop = sequenceAnimation[lEyeT].value;
    lEyeLeft = sequenceAnimation[lEyeL].value;
    rEyeTop = sequenceAnimation[rEyeT].value;
    rEyeLeft = sequenceAnimation[rEyeL].value;
    eyeSize = sequenceAnimation[eyesSize].value;
    return SizedBox(
        width: 504.12.w,
        height: 500.h,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
              left: bodyL,
              top: bodyT,
              child: Container(
                width: 179.95.w,
                height: 183.18.h,
                // transform: Matrix4.rotationY(bodyAngle),
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/login_ani_ellipse.png"))),
              )
              // child: Image.asset("assets/images/login_ani_ellipse.png",,)
              ),
          Positioned(
              left: lEyeLeft,
              top: lEyeTop,
              child: Container(
                  width: eyeSize,
                  height: eyeSize,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff075900)))),
          Positioned(
              left: rEyeLeft,
              top: rEyeTop,
              child: Container(
                  width: eyeSize,
                  height: eyeSize,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff075900)))),
          Positioned(
              left: (lEyeLeft!+rEyeLeft!)/2+8.w,
              top: (rEyeTop!+lEyeTop!)/2+10,
              child: Container(
                  width:7.0.w,
                  height: 6.0.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff075900)))),
          Positioned(
              left: sequenceAnimation[ellipseL].value + 20.w,
              top: sequenceAnimation[bottomT].value,
              child: ClipOval(
                child: Container(
                  color: sequenceAnimation[bottomColor].value,
                  height: 11.82.h,
                  width: sequenceAnimation[bottomW].value,
                  // width: ,
                ),
              ))
        ]));
  }
}
