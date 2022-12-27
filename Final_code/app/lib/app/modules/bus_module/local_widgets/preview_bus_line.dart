import 'package:app/app/data/model/bus_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusPrevBusLine extends StatelessWidget {
  final BusLineModel busLineModel;
  const BusPrevBusLine({Key? key,required this.busLineModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("bus_line", arguments: busLineModel),
      child: Container(
        width: 523.w,
        height: 122.h,
        decoration: const BoxDecoration(
            border:
            Border(bottom: BorderSide(color: Color(0xffFFCC4A), width: 3))),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
        child: Stack(children: [
          Positioned(
              left: 0,
              top: 35.05.h,
              child: Text(busLineModel.name,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 36.sp))),
          Positioned(
              left: 0,
              top: 82.05.h,
              child:
              Text("开往 ${busLineModel.stations[busLineModel.stations.length - 1]}"))
        ]),
      ),
    );
  }
}
