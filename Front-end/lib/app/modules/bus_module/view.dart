import 'package:app/app/global_widgets/bottom_navigation/view.dart';
import 'package:app/app/global_widgets/help_button/view.dart';
import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:app/app/global_widgets/top_logo/view.dart';
import 'package:app/app/modules/bus_module/local_widgets/card.dart';
import 'package:app/app/modules/departure_module/local_widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BusModulePage extends StatelessWidget {
  const BusModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BusModuleLogic>();
    final state = Get.find<BusModuleLogic>().state;

    return Container(
        color: Colors.white,
        child: SafeArea(child: Scaffold(body: GetBuilder<BusModuleLogic>(builder: (_logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              //左上方路橙logo
              Positioned(
                child: const TopLogoComponent(bgcolor: Colors.white),
                top: 24.h,
                left: 25.w,
              ),
              // 右上方请求协助按钮
              Positioned(
                child: const HelpButtonComponent(),
                top: 40.h,
                left: 353.w,
              ),
              Positioned(
                  left: 42.w,
                  top: 145.65.h,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset("assets/images/bus_drow_down.png", width: 50.w, height: 47.35.h),
                  )),

              Positioned(
                  left: 19.w,
                  top: 248.66.h + 97.h,
                  child: Container(
                      color: Colors.white,
                      width: 600.w,
                      height: _logic.state.loading ? 250.h : 480.h,
                      child: _logic.state.loading
                          ? Stack(children: [
                              Positioned(
                                  left: 57.w,
                                  top: 45.h,
                                  child: Text("正在为您匹配附近的站点及车辆", style: TextStyle(fontSize: 32.sp, letterSpacing: 2))),
                              Positioned(left: 242.w, top: 99.h, child: const BusLoadingAnimation())
                            ])
                          : const SingleChildScrollView(child: BusCard()))),
              Positioned(
                  left: 19.w,
                  top: 248.49.h,
                  child: _logic.state.loading
                      ? Container()
                      : Container(
                          width: 600.w,
                          height: 77.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF5C00),
                              boxShadow: [BoxShadow(offset: Offset(0, 20.h), color: Colors.yellow)]),
                          child: Align(
                              alignment: const Alignment(-0.8, 1),
                              child: Text(
                                "已为您匹配到:",
                                style: TextStyle(fontSize: 32.sp, color: Colors.white, fontWeight: FontWeight.bold),
                              )))),
              Positioned(bottom: 0, child: BottomNavigationComponent()),
              Positioned(
                  left: 19.w+30,
                  top: 825.49.h,
                  child: _logic.state.loading?Container():Container(
                    width: 600.w - 60,
                    height: 270.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 20,offset: const Offset(0,-10))]
                    ),
                  )),
              //常做公交与一键回家按钮
              Positioned(
                  left: 19.w,
                  top: _logic.state.loading ? 589.66.h : 825.49.h,
                  child: Container(
                      width: 600.w,
                      height: 270.h,
                      color: Colors.white,
                      // decoration: _logic.state.loading
                      //     ? null
                      //     :  BoxDecoration(
                      //         color: Colors.white,
                      //          boxShadow: [
                      //             BoxShadow(
                      //                 // blurStyle: BlurStyle.outer,
                      //                 color: Colors.grey.withOpacity(0.2),
                      //                 blurRadius: 0,
                      //
                      //                 offset: Offset(0, -20.h))
                      //           ]
                      //       ),
                      child: Stack(children: [
                        Positioned(
                            left: 62.w,
                            top: 40.h,
                            child: Image.asset("assets/images/bus_bus.png", width: 190.w, height: 190.h)),
                        Positioned(
                            left: 348.w,
                            top: 40.h,
                            child: Image.asset("assets/images/bus_home.png", width: 190.w, height: 190.h))
                      ]))),
              //一键报警按钮
              Positioned(child: const PoliceButtonComponent(), left: 376.w, bottom: 200.h)
            ]),
          );
        }))));
  }
}
