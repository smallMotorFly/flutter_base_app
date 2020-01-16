
import 'dart:convert';

import 'package:flutter_base_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_base_app/module/request/app_request_api.dart';
import 'package:flutter_base_app/module/request/app_request_entry.dart';

typedef ServerCallBack<T> = void Function(int code, T model);

class HomePageServer {

  static login<T>(ServerCallBack<T> callBack) {
    AppRequest.request(ServerAPI.login, AppRequestMethod.POST, {'username': '17621191600', 'password': '222222'}, (code, response){
      T entity = JsonConvert.fromJsonAsT<T>(json.decode(response.data));
      callBack(response.statusCode, entity);
    });
  }
}