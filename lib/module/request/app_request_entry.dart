import 'package:dio/dio.dart';
import 'app_request_api.dart';
import 'app_request_manager.dart';

/// Request Method
enum AppRequestMethod {
  POST,
  GET,
  HEAD,
  PUT,
  DELETE,
}

/*
 * dio网络请求失败的回调错误码
 */
class ResultCode {

  //正常返回是1
  static const SUCCESS = 1;

  //异常返回是0
  static const ERROR = 0;

  /// When opening  url timeout, it occurs.
  static const CONNECT_TIMEOUT = -1;

  ///It occurs when receiving timeout.
  static const RECEIVE_TIMEOUT = -2;

  /// When the server response, but with a incorrect status, such as 404, 503...
  static const RESPONSE = -3;
  /// When the request is cancelled, dio will throw a error with this type.
  static const CANCEL = -4;

  /// read the DioError.error if it is not null.
  static const DEFAULT = -5;
}


typedef RequestCallBack = void Function(int code, Response data);


class AppRequest {

  /// 请求入口
  static request(ServerAPI api, AppRequestMethod method, Map<String, String> parameters, RequestCallBack callback) async {

    switch(method) {

      case AppRequestMethod.POST:
        _requestPost(api, parameters, callback);
        break;

      case AppRequestMethod.GET:
        _requestGet(api, parameters, callback);
        break;

      case AppRequestMethod.HEAD:
        break;

      case AppRequestMethod.PUT:
        break;

      case AppRequestMethod.DELETE:
        break;
    }

  }

  /** GET请求
   *  api: path
   *  parameters: 参数
   *  callback:回调
   */
  static _requestGet(ServerAPI api, Map<String, String> parameters, RequestCallBack callback) async {

    Dio dio = AppRequestManager.instance.getDio();

    String path = getApiPath(api);

    Response response;

    try {
      if (parameters != null && parameters.isNotEmpty) {
        response = await dio.get(path, queryParameters: parameters);
      } else {
        response = await dio.get(path);
      }
    } on DioError catch(error) {

      Response errorResponse;

      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 119);
      }

      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      callback(errorResponse.statusCode, null);

      return;
    }


    callback(response.statusCode, response);

  }

  /** POST请求
   *  api: path
   *  parameters: 参数
   *  callback:回调
   */
  static _requestPost(ServerAPI api, Map<String, String> parameters, RequestCallBack callback) async {

    Dio dio = AppRequestManager.instance.getDio();

    String path = getApiPath(api);

    Response response;

    try {
      if (parameters != null && parameters.isNotEmpty) {
        response = await dio.post(path, queryParameters: parameters);
      } else {
        response = await dio.post(path);
      }

    } on DioError catch(error) {

      Response errorResponse;

      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 119);
      }

      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      callback(errorResponse.statusCode, null);

      return;
    }

    callback(response.statusCode, response);
  }

}



