import 'package:app/app/data/model/busline_mark.dart';
import 'package:app/app/data/model/user_param.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  // static const String luChengServerIp = '192.168.31.245:8866';

  static const String luChengServerIp = 'www.tzdian.top:8866';
  static Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString("token");
  }

  ///登录
  static Future<Response<dynamic>> login(UserParam userParam) async {
    return await GetConnect(timeout: const Duration(seconds: 10)).post("http://$luChengServerIp/user/login",
        {"identifier": userParam.identifier, "identityType": userParam.identityType,"credential":userParam.credential});
  }

  ///使用token登录
  static Future<Response<dynamic>> tokenLogin(String token) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().post("http://$luChengServerIp/user/login/token", {}, headers: {"authorization": token});
  }

  ///private/{type}/{uid}
  static Future<Response<dynamic>> getPrivateInformation(String type,int uid) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().get("http://$luChengServerIp/user/private/$type/$uid", headers: {"authorization": token});
  }
  ///获取验证码
  static Future<Response<dynamic>> getAuthCode(String phone) async {
    return await GetConnect().get("http://$luChengServerIp/user/code/$phone");
  }

  ///验证短信验证码
  static Future<Response<dynamic>> verifyAuthCode(String phone, String code) async {
    return await GetConnect().post("http://$luChengServerIp/user/code/$phone/$code", {});
  }

  ///获取好友
  static Future<Response<dynamic>> getFriend(String identityType, String identifier) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect()
        .get("http://$luChengServerIp/friend/$identityType/$identifier", headers: {"authorization": token});
  }

  ///获取所有好友
  static Future<Response<dynamic>> getFriends(int uid) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().get("http://$luChengServerIp/friend/$uid", headers: {"authorization": token});
  }

  ///好友添加
  static Future<Response<dynamic>> addFriend(int uid, String identityType, String identifier, String mark) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().post("http://$luChengServerIp/friend/$uid/$identityType/$identifier/$mark", {},
        headers: {"authorization": token});
  }

  ///获取附近公交
  static Future<Response<dynamic>> getNearbyBus(double log, double lat) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect(timeout: const Duration(seconds: 30))
        .get("http://$luChengServerIp/location/bus/$log/$lat", headers: {"authorization": token});
  }

  ///获取语音识别结果
  static Future<Response<dynamic>> getASRResult(String speech, int length) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().post("http://$luChengServerIp/ASR/result", {
      "speech": speech,
      "length": length,
    }, headers: {
      "authorization": token
    });
  }

  static Future<Response<dynamic>> getBusLineMark(int uid) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect()
        .get("http://$luChengServerIp/location/busline/mark/$uid", headers: {"authorization": token});
  }

  static Future<Response<dynamic>> addBusLineMark(int uid, BuslineMarkModel buslineMarkModel) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect().post("http://$luChengServerIp/location/busline/mark/$uid", {
      "uid": uid,
      "cityid": buslineMarkModel.cityid,
      "busLinestrid": buslineMarkModel.busLinestrid,
      "busLinenum": buslineMarkModel.busLinenum,
      "busStaname": buslineMarkModel.busStaname,
    }, headers: {
      "authorization": token
    });
  }

  static Future<Response<dynamic>> deleteBusLineMart(int uid, String bus_linestrid) async {
    String? token = await getToken();
    if (token == null) return const Response(statusCode: 400, bodyString: "非法访问");
    return await GetConnect()
        .delete("http://$luChengServerIp/location/busline/mark/$bus_linestrid/$uid", headers: {"authorization": token});
  }
}
