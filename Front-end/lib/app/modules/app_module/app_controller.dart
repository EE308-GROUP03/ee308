import 'package:app/app/data/model/busline_mark.dart';
import 'package:app/app/data/model/friend.dart';
import 'package:app/app/data/model/user.dart';
import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/utils/custom_color.dart';
import 'package:app/app/utils/web_socket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/bus_station.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppController extends GetxController {
  static double barHeight = ScreenUtil().statusBarHeight;
  static double bottomBarHeight = ScreenUtil().bottomBarHeight;
  static double safeAreaHeight = 1.sh - barHeight - bottomBarHeight;

  late WebSocket actionSocket;
  UserModel userModel = UserModel();
  List<FriendModel> friendList = [];
  var assist = false.obs;

  double? curLng;
  double? curLat;
  List<BusStationModel> busStationList = [];
  List<BuslineMarkModel> buslineMarkList = [];


  // var _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  void assistChange() => assist.value = !assist.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    print("woo close ======");
    super.onClose();
  }

  void initApp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //初始化用户
    userModel.fromJson(JwtDecoder.decode(sp.getString("token")!.replaceFirst("Bearer", "")));
    if (kDebugMode) {
      print('''用户初始化成功:
            id:${userModel.id}
            nickname:${userModel.nickname}
            avatar:${userModel.avatar}
            level:${userModel.level}
            status:${userModel.status}
    ''');
    }
    //初始化好友列表
    loadFriends();


    loadBuslineMarks();

    // socket.send("")


    actionSocket = WebSocket({"Authorization": sp.getString("token")});
    // 监听从服务端返回的消息
    actionSocket.open(userModel.id.toString()).listen((value) {

    });
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid
      ..backgroundColor = CustomColor.get("main")
    ;
  }


  void loadFriends() {
    ApiProvider.getFriends(userModel.id).then((resp) {
      resp.body["friends"]?.forEach((f) => friendList.add(FriendModel().fromJson(Map<String, dynamic>.from(f))));
    });
  }

  void loadBuslineMarks() {
    ApiProvider.getBusLineMark(userModel.id).then((resp) {
      print(resp.body);
      resp.body["buslines"]?.forEach((b) =>
          buslineMarkList.add(BuslineMarkModel.fromJson2(Map<String, dynamic>.from(b))));
    });
  }
}
