import 'package:app/app/data/model/bus_station.dart';
import 'package:app/app/modules/bus_module/local_widgets/station.dart';
import 'package:app/app/modules/bus_module/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusCard extends StatelessWidget {
  const BusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<BusModuleLogic>();
    List<Widget> list = [];
    for (BusStationModel e in _controller.state.busStationList) {
      list.add(BusStation(busStationModel: e));
      list.add(SizedBox(height: 70.h));
    }
    return Column(children: list);
  }
}
