import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/home/model/app_login_bean_entity.dart';
import 'package:flutter_base_app/pages/home/server/app_home_request_server.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///首页
class AppHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    HomePageServer.login<AppLoginBeanEntity>((code, model) {
      print('获得数据 = ' + model.data.userInfo.realName + ' ' + model.data.userInfo.companyName);
    });

    List<String> banners = [
      'http://windfindtech-1255850199.file.myqcloud.com/banner/VR%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E5%B0%81%E9%9D%A2-%E6%95%AC%E8%AF%B7%E6%9C%9F%E5%BE%85.png',
      'http://windfindtech-1255850199.file.myqcloud.com/banner/%E7%88%B1%E5%BF%83%E6%8D%90%E8%B5%A0%E5%85%A5%E5%8F%A3%E5%9B%BE.png',
      'http://windfindtech-1255850199.file.myqcloud.com/banner/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20190718191020.jpg',
      'http://windfindtech-1255850199.file.myqcloud.com/banner/daniethigersd1041.jpg',
      'http://windfindtech-1255850199.file.myqcloud.com/banner/live_wish.png',
      'http://windfindtech-1255850199.file.myqcloud.com/banner/%E8%B0%A2.jpg',
    ];

    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Home Page',
          ),
        ),
        /// banner 外置一个容器，方便控制大小
        body: Container(
          height: 300.0,
          /// banner
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              /// 图片加载
              return new CachedNetworkImage(
                imageUrl: banners[index],
                /// 默认菊花
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: Colors.grey,
                  size: 50.0,
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.fill,
              );
            },
            itemCount: banners.length,
            autoplay: true,
            /// 指示器
            pagination: new SwiperPagination(
                builder: SwiperPagination.dots
            ),
//            scale: 0.9,
//            viewportFraction:0.8,
            onTap: (index) => print('点击了第 $index 个'),
          ),
        ),
      ),
    );
  }
}