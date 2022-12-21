import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/global_widgets/outline_font/view.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:app/app/utils/action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'option_item.dart';

class DepartureOption extends StatelessWidget {
  const DepartureOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 368.w,
        height: 597.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          DepartureOptionItem(
              label: OutlineFontComponent(text: "地 图", size: 26.sp),
              color: const Color(0xffF2CFBA),
              assets: "assets/images/departure_location.png",
              fun: () {
                HapticFeedback.heavyImpact();
                ActionEnum.toBaiduMap();
              }),
          DepartureOptionItem(
              label: OutlineFontComponent(text: "我 要 打 车 >>", size: 26.sp),
              color: const Color(0xffFFCC4A),
              assets: "assets/images/departure_taxi.png",
              fun: () {
                HapticFeedback.heavyImpact();
              }),
          DepartureOptionItem(
              label: OutlineFontComponent(text: "我 要 坐 公 交 >>", size: 26.sp),
              color: const Color(0xffFF772A),
              assets: "assets/images/departure_bus.png",
              fun: () {
                HapticFeedback.heavyImpact();
                final _logic = Get.find<BottomNavigationLogic>();
                _logic.state.currentPage = Routes.BUS;
                Get.toNamed(Routes.BUS);
              }),
          DepartureOptionItem(
              label: OutlineFontComponent(text: "我 要 坐 地 铁 >>", size: 26.sp),
              color: const Color(0xffFF1F00),
              assets: null,
              fun: () {
                HapticFeedback.heavyImpact();
              })
        ]));
  }
}
