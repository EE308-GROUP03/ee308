import 'package:app/app/data/model/bus_line.dart';
import 'package:app/app/modules/bus_line_module/local_widgets/route_map_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusRouteMap extends StatelessWidget {
  BusRouteMap({Key? key, required this.busLineModel}) : super(key: key);
  final _itemWidth = 110.w;
  BusLineModel busLineModel;

  @override
  Widget build(BuildContext context) {
    final length = busLineModel.stations.length;

    int? current = busLineModel.dis_stat;
    List<Widget> list = [];
    list.add(Positioned(
      left: 0,
      top: 81.h,
      child: Container(width: length * _itemWidth, height: 10.h, color: const Color(0xffFFEBB5)),
    ));
    for (int i = 0; i < length; i++) {
      if (i == busLineModel.station_index) {
        list.add(Positioned(
            left: i.toDouble() * _itemWidth,
            top: 81.h - 5.h - 7.5.h,
            child: BusRouteMapItem(stationName: busLineModel.stations[i], isCurStation: true)));
      } else {
        list.add(Positioned(
            left: i.toDouble() * _itemWidth,
            top: 81.h - 5.h,
            child: BusRouteMapItem(stationName: busLineModel.stations[i], isCurStation: false)));
      }
    }
    if (current != null) {
      list.add(Positioned(
          top: -0.17.h,
          left: current.toDouble() * _itemWidth - 0.5 * _itemWidth - 25.235.w,
          child: Image.asset("assets/images/bus_line_small_bus.png", width: 50.47.w, height: 66.5.h)));
    }
    return SizedBox(
      width: length * _itemWidth,
      height: 470.h,
      child: Stack(children: list),
    );
  }
}
