import 'package:app/app/global_widgets/bottom_navigation/view.dart';
import 'package:app/app/global_widgets/help_button/view.dart';
import 'package:app/app/global_widgets/police_button/view.dart';
import 'package:app/app/global_widgets/top_logo/view.dart';
import 'package:app/app/modules/departure_module/local_widgets/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DepartureModulePage extends StatelessWidget {
   DepartureModulePage({Key? key}) : super(key: key);
 final _logic = Get.find<DepartureModuleLogic>();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: Stack(children: [
          //左上方路橙logo
          Positioned(child: const TopLogoComponent(), top: 24.h, left: 25.w),
          // 右上方请求协助按钮
          Positioned(
              child: const HelpButtonComponent(), top: 40.h, left: 353.w),
          //主体部分边框
          Positioned(
              left: 113.12.w,
              top: 227.83.h,
              child: Container(
                  width: 449.w,
                  height: 746.32.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 4),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-38.w, 38.w),
                            color: const Color(0xffFF5C00))
                      ]))),
          // 主体部分选项
          Positioned(left: 147.w, top: 329.83.h, child: const DepartureOption()),
          //  主体部分 出行文本
          Positioned(
              left: 113.12.w,
              top: 232.06.h,
              child: SizedBox(
                  width: 186.38.w,
                  height: 91.7.h,
                  child: Center(
                      child: Text("出行", style: TextStyle(fontSize: 28.sp))))),
          //一键报警按钮
          Positioned(child: PoliceButtonComponent(), left: 376.w, bottom: 200.h),
          // 底部导航栏
          Positioned(child: BottomNavigationComponent(), bottom: 0)
        ]))));
  }
}
