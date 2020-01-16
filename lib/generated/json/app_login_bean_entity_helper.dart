import 'package:flutter_base_app/pages/home/model/app_login_bean_entity.dart';
import 'package:flutter_base_app/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

/// 转换工具，转换的实体类的helper类
appLoginBeanEntityFromJson(AppLoginBeanEntity data, Map<String, dynamic> json) {
	data.ret = json['ret']?.toInt();
	data.msg = json['msg']?.toString();
	data.data = json['data'] != null ? new AppLoginBeanData().fromJson(json['data']) : null;
	return data;
}

Map<String, dynamic> appLoginBeanEntityToJson(AppLoginBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret'] = entity.ret;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = AppLoginBeanData().toJson();
	}
	return data;
}

appLoginBeanDataFromJson(AppLoginBeanData data, Map<String, dynamic> json) {
	data.userInfo = json['userInfo'] != null ? new AppLoginBeanDataUserInfo().fromJson(json['userInfo']) : null;
	data.deviceVersion = json['deviceVersion'] != null ? new AppLoginBeanDataDeviceVersion().fromJson(json['deviceVersion']) : null;
	return data;
}

Map<String, dynamic> appLoginBeanDataToJson(AppLoginBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.userInfo != null) {
		data['userInfo'] = AppLoginBeanDataUserInfo().toJson();
	}
	if (entity.deviceVersion != null) {
		data['deviceVersion'] = AppLoginBeanDataDeviceVersion().toJson();
	}
	return data;
}

appLoginBeanDataUserInfoFromJson(AppLoginBeanDataUserInfo data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.realName = json['realName']?.toString();
	data.nickName = json['nickName']?.toString();
	data.email = json['email']?.toString();
	data.sex = json['sex']?.toInt();
	data.phone = json['phone']?.toString();
	data.avatar = json['avatar'];
	data.companyName = json['companyName']?.toString();
	data.openId = json['openId'];
	data.remark = json['remark'];
	data.deleted = json['deleted']?.toString();
	data.userToken = json['userToken']?.toString();
	data.position = json['position'];
	data.redbagAuth = json['redbagAuth'];
	data.lastLoginTime = json['lastLoginTime']?.toString();
	data.userConfigInfo = json['userConfigInfo'] != null ? new AppLoginBeanDataUserInfoUserConfigInfo().fromJson(json['userConfigInfo']) : null;
	data.createTime = json['createTime']?.toString();
	return data;
}

Map<String, dynamic> appLoginBeanDataUserInfoToJson(AppLoginBeanDataUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['realName'] = entity.realName;
	data['nickName'] = entity.nickName;
	data['email'] = entity.email;
	data['sex'] = entity.sex;
	data['phone'] = entity.phone;
	data['avatar'] = entity.avatar;
	data['companyName'] = entity.companyName;
	data['openId'] = entity.openId;
	data['remark'] = entity.remark;
	data['deleted'] = entity.deleted;
	data['userToken'] = entity.userToken;
	data['position'] = entity.position;
	data['redbagAuth'] = entity.redbagAuth;
	data['lastLoginTime'] = entity.lastLoginTime;
	if (entity.userConfigInfo != null) {
		data['userConfigInfo'] = AppLoginBeanDataUserInfoUserConfigInfo().toJson();
	}
	data['createTime'] = entity.createTime;
	return data;
}

appLoginBeanDataUserInfoUserConfigInfoFromJson(AppLoginBeanDataUserInfoUserConfigInfo data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.userId = json['userId']?.toInt();
	data.redBagTag = json['redBagTag']?.toInt();
	data.shrbPersonUnionID = json['shrbPersonUnionID'];
	data.gagTag = json['gagTag']?.toInt();
	data.donateTag = json['donateTag'];
	data.seeLive = json['seeLive']?.toInt();
	return data;
}

Map<String, dynamic> appLoginBeanDataUserInfoUserConfigInfoToJson(AppLoginBeanDataUserInfoUserConfigInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['redBagTag'] = entity.redBagTag;
	data['shrbPersonUnionID'] = entity.shrbPersonUnionID;
	data['gagTag'] = entity.gagTag;
	data['donateTag'] = entity.donateTag;
	data['seeLive'] = entity.seeLive;
	return data;
}

appLoginBeanDataDeviceVersionFromJson(AppLoginBeanDataDeviceVersion data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.minVersion = json['minVersion']?.toString();
	data.latestVersion = json['latestVersion']?.toString();
	data.deviceOs = json['deviceOs']?.toString();
	data.downloadURL = json['downloadURL']?.toString();
	data.downloadPage = json['downloadPage']?.toString();
	data.createTime = json['createTime']?.toString();
	data.deleted = json['deleted']?.toString();
	return data;
}

Map<String, dynamic> appLoginBeanDataDeviceVersionToJson(AppLoginBeanDataDeviceVersion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['minVersion'] = entity.minVersion;
	data['latestVersion'] = entity.latestVersion;
	data['deviceOs'] = entity.deviceOs;
	data['downloadURL'] = entity.downloadURL;
	data['downloadPage'] = entity.downloadPage;
	data['createTime'] = entity.createTime;
	data['deleted'] = entity.deleted;
	return data;
}