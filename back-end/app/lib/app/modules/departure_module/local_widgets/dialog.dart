

import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/global_widgets/outline_font/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';
import 'option_item.dart';

class DepartureHintWidget extends StatefulWidget {
  const DepartureHintWidget({Key? key}) : super(key: key);

  @override
  State<DepartureHintWidget> createState() => _DepartureHintWidgetState();
}

class _DepartureHintWidgetState extends State<DepartureHintWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _distanceMoveUp;
  late Animation _boderWidth;
  late Animation _boderheight;
  late Animation _bodertop;
  late Animation _deltaH;

  late int index;
  late bool shifting;
  late String firstLine;
  late String secondLine;

  @override
  void initState() {
    super.initState();
    firstLine = "需要我的时候可以喊\"小路! \"";
    secondLine = "或者点击这里叫醒我!";
    index = 1;

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _distanceMoveUp = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: -340.83.h)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 100,
      ),
    ]).animate(_animationController);
    _boderWidth = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 144.3.w + 40, end: 527.w)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 100,
      ),
    ]).animate(_animationController);
    _boderheight = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 100.0.h + 20, end: 187.h)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 100,
      ),
    ]).animate(_animationController);
    _bodertop = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1160.h, end: 619.49.h)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 100,
      ),
    ]).animate(_animationController);
    _deltaH = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.h, end: 180.h)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 100,
      ),
    ]).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 137.w,
            top: 627.66.h + _distanceMoveUp.value,
            child: _DepartureDialog()),
        Positioned(
            left: 0,
            top: 627.66.h + _distanceMoveUp.value,
            child: Image.asset(
              "assets/images/departure_hint_orange.png",
              width: 150.37.w,
              height: 178.52.h,
            )),
        Positioned(
            top: _bodertop.value,
            left: 248.3.w - 20 - 5 - (_boderWidth.value - 144.3.w - 40) / 2,
            child: ClipOval(
                child: DottedBorder(
                  borderType: BorderType.Oval,
                  color: Colors.yellow,
                  strokeWidth: 8,
                  dashPattern: const [8, 8],
                  child: SizedBox(
                    width: _boderWidth.value,
                    height: _boderheight.value,
                  ),
                ))),
        Positioned(
            left: 400.w,
            top: 738.66.h + _distanceMoveUp.value,
            child: Image.asset(
              "assets/images/departure_hint_arrow.png",
              width: 203.w,
              height: 501.h - _deltaH.value,
            )),
        Positioned(
          left: 248.3.w,
          bottom: 19.01.h,
          child: index == 1
              ? Image.asset(
            "assets/images/bottom_navigation_bar_icon.png",
            width: 144.3.w,
            height: 100.0.h,
          )
              : Container(),
        ),
        Positioned(
            top: 661.5.h,
            left: 147.w,
            child: index == 2 && shifting == false
                ? _DepartureIndex2Item()
                : Container()),
        Positioned(
            left: 0,
            top: 0,
            child: index == 1
                ? GestureDetector(
                onTap: () {
                  _animationController.forward();
                  shifting = true;
                  firstLine = "接下来让小路陪伴您";
                  secondLine = "体验一次坐公交的流程吧";
                  _animationController.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      index = 2;
                      shifting = false;
                    }
                  });
                },
                child: Container(
                  color: Colors.green.withOpacity(0),
                  width: 1.sw,
                  height: AppController.safeAreaHeight,
                ))
                : Container()),
      ],
    );
  }

  Widget _DepartureDialog() {
    return Material(
      child: Container(
          width: 466.01.w,
          height: 163.h,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(-30.h, 30.h), color: const Color(0xffFFCC4A))
              ],
              border: Border.all(width: 4)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              firstLine,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 25.sp,
                color: CustomColor.get("main"),
              ),
            ),
            Text(secondLine,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 25.sp,
                    color: CustomColor.get("main")))
          ])),
    );
  }

  Widget _DepartureIndex2Item() {
    return Material(
        color: Colors.green.withOpacity(0),
        child: GestureDetector(
            onTap: () {
              final _logic = Get.find<BottomNavigationLogic>();
              _logic.state.currentPage = Routes.BUS;
              Get.toNamed("bus");
            },
            child: DepartureOptionItem(
               label: OutlineFontComponent(text:"我 要 坐 公 交 >>",size: 26.sp),
              color:  const Color(0xffFF772A),
               assets: "assets/images/departure_bus.png",
                fun:null)));
  }
}
