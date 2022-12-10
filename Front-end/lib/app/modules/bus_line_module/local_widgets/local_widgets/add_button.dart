import 'dart:io';

import 'package:app/app/data/model/bus_line.dart';
import 'package:app/app/data/model/busline_mark.dart';
import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusLineAddButton extends StatefulWidget {
  BusLineAddButton({Key? key, required this.busLineModel}) : super(key: key);
  BusLineModel busLineModel;

  @override
  State<BusLineAddButton> createState() => _BusLineAddButtonState();
}

class _BusLineAddButtonState extends State<BusLineAddButton> {
  bool isMarked = false;
  final _appCtrl = Get.find<AppController>();
  bool loading = false;

  @override
  void initState() {
    super.initState();

    for (BuslineMarkModel e in _appCtrl.buslineMarkList) {
      if (widget.busLineModel.bus_linestrid == e.busLinestrid) {
        isMarked = true;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isMarked) {
      return GestureDetector(
        onTap: () async {
          EasyLoading.show(status: "请稍等...");
          ApiProvider.deleteBusLineMart(_appCtrl.userModel.id, widget.busLineModel.bus_linestrid).then((resp) {
            if (resp.body["success"]) {

              setState(() {
                isMarked = false;
              });
              EasyLoading.showSuccess("删除成功");
              _appCtrl.loadBuslineMarks();

            }
          });
          //如果删除成功
        },
        child: Container(
            width: 481.w,
            height: 103.h,
            decoration: BoxDecoration(
                border: Border.all(width: 4), borderRadius: BorderRadius.circular(10), color: const Color(0xffD9D9D9)),
            child: Center(
                child: Text("已经添加到常坐的公交",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.sp)))),
      );
    } else {
      return GestureDetector(
        onTap: () async {
          EasyLoading.show(status: "请稍等...");

          BuslineMarkModel buslineMarkModel = BuslineMarkModel(
              uid: _appCtrl.userModel.id,
              cityid: widget.busLineModel.cityid,
              busLinestrid: widget.busLineModel.bus_linestrid,
              busLinenum: widget.busLineModel.bus_linenum,
              busStaname: widget.busLineModel.bus_staname);

          Response resp = await ApiProvider.addBusLineMark(_appCtrl.userModel.id, buslineMarkModel);

          //如果添加成功

          if (resp.body["success"]) {


            setState(() {
              isMarked = true;
            });
            EasyLoading.showSuccess("添加成功");
            _appCtrl.loadBuslineMarks();
          }
        },
        child: Container(
            width: 481.w,
            height: 103.h,
            decoration: BoxDecoration(
                border: Border.all(width: 4), borderRadius: BorderRadius.circular(10), color: const Color(0xffF57B36)),
            child: Center(
                child: Text("添加到常坐的公交",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.sp)))),
      );
    }
  }
}
