import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BottomNavigationComponent extends StatelessWidget {
  final logic = Get.find<BottomNavigationLogic>();
  final state = Get.find<BottomNavigationLogic>().state;

  BottomNavigationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 179.61.h,
        color: Colors.white.withOpacity(0),
        child: Stack(alignment: Alignment.center, children: [
          //左圆圈带边框
          Positioned(
              left: 80.w,
              top: logic.state.currentPage == Routes.DEPARTURE ? 0 : 24.38.h,
              child: Container(
                  width: 130.h - 8,
                  height: 130.h - 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 4, color: Colors.black)))),
          //右圆圈带边框 179.61-155.23
          Positioned(
              right: 80.w,
              top: logic.state.currentPage == Routes.MINE ? 0 : 24.38.h,
              child: Container(
                  width: 130.h - 8,
                  height: 130.h - 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 4, color: Colors.black)))),
          //上黑条
          Positioned(
              bottom: 0,
              child: Container(
                  width: 1.sw,
                  height: 155.23.h,
                  decoration: const BoxDecoration(
                      color: Colors.white, border: Border(top: BorderSide(color: Colors.black, width: 4))))),
          //白条遮盖
          Positioned(bottom: 0, child: Container(width: 1.sw, height: 155.23.h - 3, color: Colors.white)),
          //左圆圈无边框 + Icon
          Positioned(
              left: 80.w + 2,
              top: logic.state.currentPage == Routes.DEPARTURE ? 4 : 24.38.h + 4,
              child: GestureDetector(
                  onTap: () {
                    logic.toDeparture();
                  },
                  child: Container(
                      width: 130.h - 12,
                      height: 130.h - 12,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: Image.asset("assets/images/bottom_navigation_bar_home.png",
                              width: 130.h - 12 - 20.h, height: 130.h - 12 - 20.h))))),
          //右圆圈无边框 + Icon
          Positioned(
              right: 80.w + 2,
              top: logic.state.currentPage == Routes.MINE ? 4 : 24.38.h + 4,
              child: GestureDetector(
                  onTap: () {
                    logic.toMine();
                  },
                  child: Container(
                      width: 130.h - 12,
                      height: 130.h - 12,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: Image.asset("assets/images/bottom_navigation_bar_mine.png",
                              width: 130.h - 12 - 20.h, height: 130.h - 12 - 20.h))))),

          //179.61 - 60.69 - 100
          Positioned(
              left: 248.3.w,
              top: 60.69.h,
              child: GestureDetector(
                  onTap: () => Get.toNamed("voice_assistant"),
                  child: Image.asset("assets/images/bottom_navigation_bar_icon.png", width: 144.3.w, height: 100.0.h))),
          Positioned(
              top: 143.39.h,
              child: Text(
                "语 音 助 手",
                style: TextStyle(fontSize: 18.sp),
              ))
        ]));
  }
}
