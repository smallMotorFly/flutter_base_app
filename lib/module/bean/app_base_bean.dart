
/// 基类bean
class  AppBaseBean<T> {

  String code;

  String msg;

}

/// 单bean
class AppBean<T> extends AppBaseBean {

  T data;
}

/// bean列表
class AppBeanList<T> extends AppBaseBean {

  List<T> data;

  int page;

  int size;

  int total;

}