import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/utils/action_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class WebSocket extends ISocket {
  final Map<String, dynamic> headers;

  static const _URL = "ws://${ApiProvider.luChengServerIp}/websocket/";

  // GlobalConfig
  IOWebSocketChannel? _channel;

  final int _intervalSeconds = 50;

  WebSocket(this.headers);

  /// 关闭连接
  @override
  void close() {
    _channel?.sink.close();
  }

  /// 监听服务端返回的数据
  @override
  ISocket listen(ValueChanged<String> _callBack) {
    _callBack = _callBack;

    return this;
  }

  /// 建立连接
  @override
  ISocket open(String uid) {
    _channel =
        IOWebSocketChannel.connect(_URL + uid, headers: headers, pingInterval: Duration(seconds: _intervalSeconds));
    _channel!.stream.handleError((error) {
      print('连接发生错误：$error');
    }).listen((message) {
      // 监听服务端返回的消息
      _handleMessage(message);
    });
    return this;
  }

  /// 向服务端发送消息
  @override
  ISocket send(String message) {
    _channel?.sink.add(message);
    return this;
  }

  /// 处理从服务端返回的消息
  void _handleMessage(message) {
    if (message == ActionEnum.POLICE) {
      ActionEnum.toPolice();
    } else if (message == ActionEnum.OPEN_PAY_CODE) {
      ActionEnum.toAlipay();
    } else if (message == ActionEnum.REALTIME_MAP){
      ActionEnum.toBaiduMap();
    }else if(message ==ActionEnum.TAKE_BUS){
      ActionEnum.toTakeBus();
    }
  }
}

/// 抽象层封装：提取通用socket 功能
abstract class ISocket {
  /// 建立连接
  /// user_id: 用户ID，返回 ISocket 是为了链式调用
  ISocket open(String uid);

  /// 发送消息
  ISocket send(String message);

  /// 接收数据
  ISocket listen(ValueChanged<String> _callBack);

  /// 关闭连接
  void close();
}

class ActionConstants {
  static String authTokenK = "auth-oken";
  static String authTokenV = "ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa";
  static String courseFlagK = "course-flag";
  static String courseFlagV = "fa";
  static const theme = "hi_theme";

  /// 设置请求头校验，注意留意：Console的log输出：flutter: received:
  static headers() {
    Map<String, dynamic> header = {
      ActionConstants.authTokenK: ActionConstants.authTokenV,
      ActionConstants.courseFlagK: ActionConstants.courseFlagV
    };
    // var boardingPass = LoginDao.getBoardingPass();
    // if (boardingPass != null) {
    //   header[LoginDao.BOARDING_PASS] = boardingPass;
    // }
    return header;
  }
}
