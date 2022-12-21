import 'package:app/app/data/model/bus_line.dart';
import 'package:app/app/data/model/bus_station.dart';
import 'package:app/app/modules/bus_module/local_widgets/preview_bus_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusStation extends StatelessWidget {
  final BusStationModel busStationModel;
  const BusStation({Key? key,required this.busStationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = [];
    list.add(Container(
      padding: EdgeInsets.fromLTRB(40.w, 0, 0, 0),
      child: Row(children: [
        Container(
            width: 10.w,
            height: 10.w,
            decoration: const BoxDecoration(
                color: Color(0xffFF5C00), shape: BoxShape.circle)),
        Text(" ${busStationModel.name}站",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34.sp,
                letterSpacing: 2)),
        Text("(距您${busStationModel.xydistance.round()}m)",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 24.sp, color: Colors.black.withOpacity(0.8)))
      ]),
    ));
    for (BusLineModel e in busStationModel.busLineList) {
      list.add(BusPrevBusLine(busLineModel :e));
    }

    return Container(
      width: 600.w,
      child: Column(children: list),
    );
  }
}
