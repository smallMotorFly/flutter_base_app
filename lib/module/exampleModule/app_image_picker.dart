import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

///图片选择 测试
class AppImagePickerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AppImagePickerPage();
  }

}

class _AppImagePickerPage extends State<AppImagePickerPage> {

  List<Asset> images = List<Asset>();

  String _error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// 相册内容
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {

    List<Asset> resultList;
    String error;

    try {
      ///异步pick照片
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true

      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    ///拿到图片更新数据源，刷新Build
    setState(() {
      if (resultList != null) {
        images = resultList;
        if (error == null) {
          _error = 'No Error Detected';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Pieker Images'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Error: $_error'),
            ),
            RaisedButton(
              child: Text('Pick Images Action'),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
        ),
      ),
    );
  }

}