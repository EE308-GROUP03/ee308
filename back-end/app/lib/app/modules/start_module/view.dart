import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartModule extends StatefulWidget {
  const StartModule({Key? key}) : super(key: key);

  @override
  State<StartModule> createState() => _StartModuleState();
}

class _StartModuleState extends State<StartModule>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation _luBoxX;
  late Animation _luBoxY;
  late Animation _luBoxW;
  double opacityLevel = 0.0;
  double opacityLevel2 = 1.0;
  double opacityLevel3 = 0.0;

  late Animation _luBoxH;
  late Animation<double> _luAngle;
  late Animation _luRightHandDeltaY;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animController.addListener(() {
      setState(() {});
    });
    //===========================================
    _luBoxX = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween(206.w), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 206.w, end: 96.w), weight: 100),
    ]).animate(_animController);
    //===========================================

    _luBoxY = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween(590.1.h), weight: 100),
      TweenSequenceItem(
          tween: Tween(begin: 590.11.h, end: 382.94.h), weight: 100)
    ]).animate(_animController);
    //===========================================

    _luBoxW = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween(226.w), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 226.w, end: 169.5.w), weight: 100)
    ]).animate(_animController);
    //===========================================

    _luBoxH = TweenSequence([
      TweenSequenceItem<double>(tween: ConstantTween(200.h), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 200.h, end: 150.h), weight: 100)
    ]).animate(_animController);
    //===========================================

    _luAngle = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.05), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.0), weight: 300)
    ]).animate(_animController);
    //===========================================

    _luRightHandDeltaY = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 25.h), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 25.h, end: 0.0), weight: 300)
    ]).animate(_animController);
    _animController.forward();
    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        opacityLevel = 1.0;
      }
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        opacityLevel3 = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(top: 72.77.h, left: 55.w, child: _startTopLeftLogo()),
              Positioned(
                  left: 80.w, top: 279.94.h, child: _startLuChengOImage()),
              //路橙logo摇手动画
              Positioned(
                  left: _luBoxX.value,
                  top: _luBoxY.value,
                  child: _startLuChengWaveing()),
              Positioned(
                  left: 80.w, top: 491.94.h, child: _startLuChengMaluImage()),
              Positioned(
                  left: 278.w, top: 385.94.h, child: _startLuChengRangeImage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _startLuChengOImage() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacityLevel,
      child: Image.asset(
        "assets/images/start_o.png",
        width: 151.65.w,
        height: 250.h,
      ),
    );
  }

  Widget _startTopLeftLogo() {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacityLevel3,
        onEnd: () => Future.delayed(
            const Duration(milliseconds: 300), () => Get.offAllNamed("login")),
        child: SizedBox(
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
                      width: 227.w, height: 23.47.h, fit: BoxFit.fill))
            ])));
  }

  Widget _startLuChengMaluImage() {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacityLevel,
        onEnd: () {
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              opacityLevel = 0;
              opacityLevel2 = 0;
            });
          });
        },
        child: Image.asset("assets/images/start_malu.png",
            width: 515.w, height: 65.h));
  }

  Widget _startLuChengRangeImage() {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacityLevel,
        child: Image.asset("assets/images/start_range.png",
            width: 298.w, height: 171.h));
  }

  Widget _startLuChengWaveing() {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: opacityLevel2,
        child: SizedBox(
            height: _luBoxH.value,
            width: _luBoxW.value,
            child: Stack(children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset("assets/images/departure_hint_orange.png",
                      width: (195.67 / 226) * _luBoxW.value,
                      height: _luBoxH.value)),
              Positioned(
                  left: (196 / 226) * _luBoxW.value,
                  top: (100 / 200) * _luBoxH.value +
                      _luRightHandDeltaY.value * 2 / 3,
                  child: RotationTransition(
                      turns: _luAngle,
                      child: Image.asset("assets/images/start_right_hand.png",
                          width: _luBoxW.value * 0.12819,
                          height: _luBoxH.value * 0.15)))
            ])));
  }
}
