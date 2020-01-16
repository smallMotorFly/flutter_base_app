

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Request Method
enum AppRequestEnvironment {
  DEVELOP,
  TEST,
  RELEASE,
  CUSTOM,
}

// 単例
class AppRequestManager {
  ///工厂模式
  factory AppRequestManager() =>_getInstance();

  static AppRequestManager get instance => _getInstance();

  static AppRequestManager _instance;

  AppRequestManager._internal() {
    ///初始化
  }

  static AppRequestManager _getInstance() {

    if (_instance == null) {
      _instance = new AppRequestManager._internal();

      _instance._dio = _instance.getDio();
    }
    return _instance;
  }
  /// 网络示例
  Dio _dio;

  ///打包环境
  AppRequestEnvironment env = AppRequestEnvironment.DEVELOP;



  String baseUrl() {
    String url = 'http://10.230.1.127:8180';
    switch(env) {
      case AppRequestEnvironment.DEVELOP:
        url = 'http://10.230.1.127:8180';
        break;
      case AppRequestEnvironment.TEST:
        url = 'http://10.230.1.127:8180';
        break;
      case AppRequestEnvironment.CUSTOM:
        url = 'http://10.230.1.127:8180';
        break;
      case AppRequestEnvironment.RELEASE:
        url = 'https://api.windfindtech.com';
        break;
    }
    return url;
  }

  /// 自定义Dio
  Dio getDio() {

    if (_dio == null) {

      _dio = new Dio();

      _dio.options.connectTimeout = 10000;

      /**
       * 拦截器-DEBUG模式
       */
      if (kDebugMode) {
        _dio.interceptors.add(InterceptorsWrapper(
            onRequest: (RequestOptions options) async{

              print("\n====================== 请求数据 =======================");
              print("url = ${options.uri.toString()}");
              print("headers = ${options.headers}");
              print("params = ${options.queryParameters}");

              return options;
            },

            onResponse: (Response response) {

              print("\n====================== 响应数据 =======================");
              print("code = ${response.statusCode}");
              print("data = ${response.data}");
              print("\n");

            },

            onError: (DioError e) {

              print("\n================== 错误响应数据 ======================");
              print("type = ${e.type}");
              print("message = ${e.message}");
              print("\n");
            }
        ));
      }
    }

    _dio.options.baseUrl = AppRequestManager.instance.baseUrl();

    _dio.options.headers = {'appVersion': '2.3.4', 'appName': 'jery', 'userToken':'', 'deviceOs': "iOS"};

    return _dio;
  }

}




