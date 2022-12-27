// ignore_for_file: constant_identifier_names

import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionEnum {
  static const String TAKE_TAXI = "TAKE_TAXI";
  static const String TAKE_BUS = "TAKE_BUS";
  static const String TAKE_SUBWAY = "TAKE_SUBWAY";
  static const String POLICE = "POLICE";
  static const String REALTIME_MAP = "REALTIME_MAP";
  static const String OPEN_PAY_CODE = "OPEN_PAY_CODE";

  static Map<String, String> actions = {
    OPEN_PAY_CODE: "出示付款码",
    TAKE_TAXI: "打车",
    TAKE_BUS: "坐公交",
    TAKE_SUBWAY: "坐地铁",
    POLICE: "一键报警",
    REALTIME_MAP: "实景地图",
  };

  //对应2--坐公交
  static Future toAlipay() async {
    BuildContext? context = Get.context;
    if (context == null) {
      return;
    }
    var _url = Uri.parse("alipayqr://platformapi/startapp?saId=20000056");
    try {
      await launchUrl(_url);
    } catch (e) {
      AwesomeDialog(
        context: context,
        headerAnimationLoop: true,
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.WARNING,
        title: '警告',
        desc: '您未安装支付宝或者未授予权限...',
      ).show();
    }
  }

  static Future toBaiduMap() async {
    BuildContext? context = Get.context;
    if (context == null) {
      return;
    }
    var _url = Uri.parse("baidumap://map/show");
    try {
      await launchUrl(_url);
    } catch (e) {
      AwesomeDialog(
        context: context,
        headerAnimationLoop: true,
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.WARNING,
        title: '警告',
        desc: '您未安装百度地图或者未授予权限...',
      ).show();
    }
  }

  static Future toTakeBus() async {
    final _bottomCtrl = Get.find<BottomNavigationLogic>();
    _bottomCtrl.state.currentPage = Routes.BUS;
    Get.toNamed(Routes.BUS);
  }

  static Future toPolice() async {
    var _url = Uri.parse("tel:110");

    await launchUrl(_url);
  }
}
