import 'package:app/app/modules/bus_line_module/local_widgets/vertical_text.dart';
import 'package:app/app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusRouteMapItem extends StatelessWidget {
  BusRouteMapItem({Key? key, required this.isCurStation, required this.stationName}) : super(key: key);
  final bool isCurStation;
  final String stationName;
  final _itemWidth = 110.w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: Column(
          children: isCurStation
              ? [
                  Container(
                    width: 35.h,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFCC4A),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffFF5C00), width: 7.5.h)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BusVerticalText(str:stationName,fontWeight: FontWeight.w900),
                  SizedBox(height: 15.h),
                  Container(
                    width: 56.w,
                    height: 150.h,
                    constraints: BoxConstraints(minHeight: 150.h, minWidth: 56.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomColor.get("main"),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(children: [
                      Text("离",
                          style: TextStyle(color: const Color(0xffFF5C00), fontWeight: FontWeight.bold, fontSize: 24.sp)),
                      Text("我",
                          style: TextStyle(color: const Color(0xffFF5C00), fontWeight: FontWeight.bold, fontSize: 24.sp)),
                      Text("最",
                          style: TextStyle(color: const Color(0xffFF5C00), fontWeight: FontWeight.bold, fontSize: 24.sp)),
                      Text("近",
                          style: TextStyle(color: const Color(0xffFF5C00), fontWeight: FontWeight.bold, fontSize: 24.sp)),
                    ]),
                  )
                ]
              : [
                  Container(
                    width: 20.h,
                    height: 20.h,
                    decoration: const BoxDecoration(color: Color(0xffFFCC4A), shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BusVerticalText(str:stationName,fontWeight: FontWeight.w500),
                ]),
    );
  }
}
