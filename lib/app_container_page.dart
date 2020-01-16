import 'package:flutter/material.dart';
import 'package:flutter_base_app/module/exampleModule/app_image_picker.dart';
import 'package:flutter_base_app/pages/home/pages/app_home_page.dart';
import 'package:flutter_base_app/pages/mine/app_mine_page.dart';

import 'baseView/appWebView.dart';

/// 这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class AppContainerPage extends StatefulWidget {

  //构造方法
  AppContainerPage({Key key}) : super(key: key);

  @override
  _AppContainerPage createState() => _AppContainerPage();

}

/// Tabbar数据源
class _Item {
  String title;

  String defaultIcon;

  String activeIcon;

  _Item(this.title, this.defaultIcon, this.activeIcon);

}



/// 内部 类实现
class _AppContainerPage extends State<AppContainerPage> {

  final AppWebView appCenterPage = AppWebView(url: 'http://www.baidu.com', title: 'webView');

  /// 底部导航控制的业务页面
  List<Widget> pages;

  /// 底部导航按钮-默认颜色
  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  /// 底部导航数据集
  final itemModels = [
    _Item('首页', 'assets/images/icon_home.png', 'assets/images/icon_home_highlight.png'),
    _Item('中间页', 'assets/images/icon_vr_white.png', 'assets/images/icon_vr_green.png'),
    _Item('我的', 'assets/images/icon_mine.png', 'assets/images/icon_mine_highlight.png'),
    _Item('图片', 'assets/images/icon_mine.png', 'assets/images/icon_mine_highlight.png'),
  ];
  /// 底部导航按钮集
  List<BottomNavigationBarItem> itemList;

  /// 默认点击位置
  int _selectedIndex = 0;

  /// 构造方法，数据初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (pages == null) {
      pages = [
        AppHomePage(),
        appCenterPage,
        AppMinePage(),
        AppImagePickerPage(),
      ];
    }

    if (itemList == null) {
      itemList = itemModels
          .map( (item) => BottomNavigationBarItem(
          icon: Image.asset(
            item.defaultIcon,
            width: 30.0,
            height: 30.0,
          ),
          title: Text(
            item.title,
            style: TextStyle(fontSize: 10.0),
          ),
          activeIcon: Image.asset(
            item.activeIcon,
            width: 30.0,
            height: 30.0,
          ),
          ))
          .toList();
    }
  }

  /// 显隐 点击的按钮所控制的界面 (Offstage 控制widget元素显隐)
  Widget _getPages(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index,
        child: pages[index],
      ),
    );
  }

  /// 配置底部导航，及所属页面
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _getPages(0),
          _getPages(1),
          _getPages(2),
          _getPages(3),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        iconSize: 14,
        currentIndex: _selectedIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}