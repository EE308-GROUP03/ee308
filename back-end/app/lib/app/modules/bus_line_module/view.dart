import 'package:app/app/data/model/bus_line.dart';
import 'package:app/app/global_widgets/bottom_navigation/view.dart';
import 'package:app/app/global_widgets/help_button/view.dart';
import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:app/app/global_widgets/top_logo/view.dart';
import 'package:app/app/modules/bus_line_module/local_widgets/add_button.dart';
import 'package:app/app/modules/bus_line_module/local_widgets/route_map.dart';
import 'package:app/app/utils/action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BusLineModulePage extends StatelessWidget {
  const BusLineModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BusLineModuleLogic>();
    final state = Get.find<BusLineModuleLogic>().state;
    final _itemWidth = 110.w;
    BusLineModel _busLineModel = Get.arguments as BusLineModel;
    state.scrollController =
        ScrollController(initialScrollOffset: (_busLineModel.station_index + 0.5) * _itemWidth - 0.5.sw);
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              body: Stack(children: [
            //左上方路橙logo
            Positioned(child: const TopLogoComponent(), top: 24.h, left: 25.w),
            // 右上方请求协助按钮
            Positioned(child: const HelpButtonComponent(), top: 40.h, left: 353.w),
            //返回按钮
            Positioned(
                left: 42.w,
                top: 145.65.h,
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset("assets/images/bus_drow_down.png", width: 50.w, height: 47.35.h))),
            // 路线总览
            Positioned(
                left: 57.w,
                top: 206.15.h,
                child: SizedBox(
                    width: 524.w,
                    height: 122.h,
                    child: Stack(children: [
                      Positioned(
                          left: 0,
                          top: 35.05.h,
                          child:
                              Text(_busLineModel.name, style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold))),
                      Positioned(
                          left: 359.w,
                          top: 35.h,
                          child: Text("预计5分钟到达", style: TextStyle(fontSize: 24.sp, color: Colors.orange))),
                      Positioned(
                          left: 0,
                          top: 82.05.h,
                          child: Text("开往 ${_busLineModel.stations[_busLineModel.stations.length - 1]}",
                              style: TextStyle(fontSize: 24.sp))),
                      Positioned(
                          left: 399.w,
                          top: 81.h,
                          child: Text("末班19:00", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)))
                    ]))),
            //  线路图
            Positioned(
                left: 34.w,
                top: 342.15.h,
                child: SizedBox(
                  width: 570.w,
                  height: 470.h,
                  child: GetBuilder<BusLineModuleLogic>(
                    assignId: true,
                    builder: (_logic) {
                      return SingleChildScrollView(
                          controller: state.scrollController,
                          scrollDirection: Axis.horizontal,
                          child: BusRouteMap(busLineModel: _busLineModel));
                    },
                  ),
                )),

            Positioned(
                left: 444.w,
                top: 370.h,
                child: Image.asset("assets/images/bus_line_arrow.png", width: 150.w, height: 30.h)),
            // 点击换方向按钮
            Positioned(
                left: 404.w,
                top: 154.16.h,
                child: GestureDetector(
                  onTap:(){
                    // Iterable<String> list  = _busLineModel.stations.reversed;
                    // _busLineModel.stations.clear();
                    // _busLineModel.stations.addAll(list);
                    //
                    // logic.reverse();
                  },
                    child: Image.asset("assets/images/bus_line_change_dir.png", width: 190.w, height: 46.44.h))),
            Positioned(bottom: 0, child: BottomNavigationComponent()),
            //添加到常坐公交
            Positioned(
                left: 78.w,
                top: 794.15.h,
                child:BusLineAddButton(busLineModel: _busLineModel,)),
            // 准备上车
            Positioned(
                left: 78.w,
                top: 922.15.h,
                child: GestureDetector(
                    onTap: () =>ActionEnum.toAlipay(),
                    child: Container(
                        width: 481.w,
                        height: 103.h,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFFCC4A)),
                        child: Stack(alignment: Alignment.center, children: [
                          Text(
                            "准备上车",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.sp),
                          ),
                          Positioned(
                              left: 38.w,
                              top: 6.h,
                              child: Image.asset("assets/images/health_code_black.png", width: 75.w, height: 75.w))
                        ])))),
            //一键报警按钮
            Positioned(child: const PoliceButtonComponent(), left: 376.w, bottom: 200.h),
          ])),
        ));
  }
}
