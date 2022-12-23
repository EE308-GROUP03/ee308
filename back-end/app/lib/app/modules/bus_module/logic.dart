import 'dart:io';

import 'package:app/app/data/model/bus_station.dart';
import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'state.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart' show BMFLog, BMFMapSDK, BMF_COORD_TYPE;

class BusModuleLogic extends GetxController {
  final BusModuleState state = BusModuleState();

  final LocationFlutterPlugin _myLocPlugin = LocationFlutterPlugin();
  Map result = {};

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    requestPermission();

    /// 设置用户是否同意SDK隐私协议
    /// since 3.1.0 开发者必须设置
    BMFMapSDK.setAgreePrivacy(true);
    _myLocPlugin.setAgreePrivacy(true);

    // 百度地图sdk初始化鉴权
    if (Platform.isIOS) {
      _myLocPlugin.authAK('请在此输入您在开放平台上申请的API_KEY');
      BMFMapSDK.setApiKeyAndCoordType('请在此输入您在开放平台上申请的API_KEY', BMF_COORD_TYPE.BD09LL);
    } else if (Platform.isAndroid) {
      // Android 目前不支持接口设置Apikey,
      // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
      BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
    }
    locationAction();
    _myLocPlugin.startLocation();

    ///接受定位回调
    _myLocPlugin.seriesLocationCallback(callback: (BaiduLocation result) {
      print("定位:${result.latitude} ${result.longitude}");
      _myLocPlugin.stopLocation();
      double lat = result.latitude ?? 26.00000;
      double lng = result.longitude ?? 119.00000;
      final _appCtrl = Get.find<AppController>();

      double? curLat = _appCtrl.curLat;
      double? curLng = _appCtrl.curLng;

      if (curLat != null && curLng != null) {
        if ((lat - curLat).abs() < 0.00002 || (lng - curLng).abs() < 0.00002) {
          state.loading = false;
          state.busStationList.addAll(_appCtrl.busStationList);
          update();
          return;
        }
      }
      // if(result.latitude - re)
      _loadData(result.latitude ?? 26.0, result.longitude ?? 119.0).then((value) {
        if (value != null) {
          state.loading = false;
          for (dynamic e in value) {
            state.busStationList.add(BusStationModel().fromJson(e));
          }
          _appCtrl.busStationList.addAll(state.busStationList);
          update();
        }
      });
      _appCtrl.curLat = result.latitude;
      _appCtrl.curLng = result.longitude;
    });
  }

  Future _loadData(double latitude, double longitude) async {
    return await ApiProvider.getNearbyBus(longitude, latitude).then((resp) {
      if (resp.body["success"]) {
        return resp.body["bus"];
      }
    });
  }

  void locationAction() async {
    /// 设置android端和ios端定位参数
    /// android 端设置定位参数
    /// ios 端设置定位参数
    Map iosMap = initIOSOptions().getMap();
    Map androidMap = initAndroidOptions().getMap();

    await _myLocPlugin.prepareLoc(androidMap, iosMap);
  }

// 动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      // 权限申请通过
    } else {}
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  BaiduLocationAndroidOption initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
        // 定位模式，可选的模式有高精度、仅设备、仅网络。默认为高精度模式
        locationMode: BMFLocationMode.hightAccuracy,
        // 是否需要返回地址信息
        isNeedAddress: true,
        // 是否需要返回海拔高度信息
        isNeedAltitude: true,
        // 是否需要返回周边poi信息
        isNeedLocationPoiList: true,
        // 是否需要返回新版本rgc信息
        isNeedNewVersionRgc: true,
        // 是否需要返回位置描述信息
        isNeedLocationDescribe: true,
        // 是否使用gps
        openGps: true,
        // 可选，设置场景定位参数，包括签到场景、运动场景、出行场景
        locationPurpose: BMFLocationPurpose.sport,
        // 坐标系
        coordType: BMFLocationCoordType.bd09ll,
        // 设置发起定位请求的间隔，int类型，单位ms
        // 如果设置为0，则代表单次定位，即仅定位一次，默认为0
        scanspan: 0);
    return options;
  }

  BaiduLocationIOSOption initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
      // 坐标系
      coordType: BMFLocationCoordType.bd09ll,
      // 位置获取超时时间
      locationTimeout: 10,
      // 获取地址信息超时时间
      reGeocodeTimeout: 10,
      // 应用位置类型 默认为automotiveNavigation
      activityType: BMFActivityType.automotiveNavigation,
      // 设置预期精度参数 默认为best
      desiredAccuracy: BMFDesiredAccuracy.best,
      // 是否需要最新版本rgc数据
      isNeedNewVersionRgc: true,
      // 指定定位是否会被系统自动暂停
      pausesLocationUpdatesAutomatically: false,
      // 指定是否允许后台定位,
      // 允许的话是可以进行后台定位的，但需要项目   配置允许后台定位，否则会报错，具体参考开发文档
      allowsBackgroundLocationUpdates: true,
      // 设定定位的最小更新距离
      distanceFilter: 10,
    );
    return options;
  }
}
