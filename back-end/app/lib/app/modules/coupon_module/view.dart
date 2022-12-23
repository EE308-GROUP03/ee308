import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CouponModulePage extends StatelessWidget {
  const CouponModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CouponModuleLogic>();
    final state = Get.find<CouponModuleLogic>().state;

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: Stack(clipBehavior: Clip.none, children: [
          Positioned(
              left: 0,
              top: 0,
              child: Container(
                  width: 637.w,
                  height: 147.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(offset: Offset(0, 5), color: Colors.black, blurRadius: 10)]),
                  child: Stack(alignment: Alignment.center, children: [
                    Text("消费赞", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp, letterSpacing: 3)),
                    Positioned(
                        left: 30.w,
                        child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset("assets/images/bus_drow_down.png", width: 50.w, height: 50.w)))
                  ]))),
          Positioned(
              top: 278.28.h,
              left: 39.w,
              child: SizedBox(
                  width: 560.w,
                  height: 1000.h,
                  child: GridView.count(crossAxisCount: 2, children: [
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h),
                    Image.asset("assets/images/consumption_coin_card_square.png", width: 264.w, height: 296.h)
                  ]))),
          Positioned(
              left: 491.w,
              top: 167.28.h,
              child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: const Color(0xffFFCC4A), border: Border.all(width: 3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.heart_broken, color: Colors.red, size: 30.w),
                      Text("${state.balance ?? '空'}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)
                    ],
                  ))),
          Positioned(
              left: 39.w,
              top: 211.28.h,
              child: Text("集赞兑换", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp))),
          Positioned(left: 376.w, bottom: 200.h, child: const PoliceButtonComponent())
        ]))));
  }
}
