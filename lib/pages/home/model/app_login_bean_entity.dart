import 'package:flutter_base_app/generated/json/base/json_convert_content.dart';


/// 通过FlutterJsonBeanFactory 蒋json数据格式转换为一下实体类。并生成了实体类的helper类，以便于jsonToEntity。
class AppLoginBeanEntity with JsonConvert<AppLoginBeanEntity> {
	int ret;
	String msg;
	AppLoginBeanData data;
}

class AppLoginBeanData with JsonConvert<AppLoginBeanData> {
	AppLoginBeanDataUserInfo userInfo;
	AppLoginBeanDataDeviceVersion deviceVersion;
}

class AppLoginBeanDataUserInfo with JsonConvert<AppLoginBeanDataUserInfo> {
	int id;
	String realName;
	String nickName;
	String email;
	int sex;
	String phone;
	dynamic avatar;
	String companyName;
	dynamic openId;
	dynamic remark;
	String deleted;
	String userToken;
	dynamic position;
	dynamic redbagAuth;
	String lastLoginTime;
	AppLoginBeanDataUserInfoUserConfigInfo userConfigInfo;
	String createTime;
}

class AppLoginBeanDataUserInfoUserConfigInfo with JsonConvert<AppLoginBeanDataUserInfoUserConfigInfo> {
	int id;
	int userId;
	int redBagTag;
	dynamic shrbPersonUnionID;
	int gagTag;
	dynamic donateTag;
	int seeLive;
}

class AppLoginBeanDataDeviceVersion with JsonConvert<AppLoginBeanDataDeviceVersion> {
	int id;
	String minVersion;
	String latestVersion;
	String deviceOs;
	String downloadURL;
	String downloadPage;
	String createTime;
	String deleted;
}
