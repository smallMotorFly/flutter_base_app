
/// 获取各个接口的path
///
enum ServerAPI {
  login,
  register,
  getConfigure,
  logout,
}


String getApiPath(ServerAPI api) {
  switch(api) {
    case ServerAPI.login:
      return '/jery/user/caslogin';
      break;
    case ServerAPI.register:
      return '/api/login';
      break;
    case ServerAPI.getConfigure:
      return '/api/login';
      break;
    case ServerAPI.logout:
      return '/api/login';
      break;
  }
  return '';
}