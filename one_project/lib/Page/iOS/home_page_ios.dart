import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:one_project/Util/screen.dart';

class HomeViewController extends StatefulWidget {
  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  final bannerList = [
    'https://dev-m-bucket.oss-cn-shanghai.aliyuncs.com/imgupload/1557482641065-head-portrait.jpg',
    'https://dev-m-bucket.oss-cn-shanghai.aliyuncs.com/imgupload/1557474913293-head-portrait.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          cycleScrollView()
          ],
      ),
    );
  }


  BannerSwiper cycleScrollView() {
    return BannerSwiper(
      height: 204,
      width: Screen.width.toInt(),
      //轮播图数目 必传
      length: bannerList.length,
      autoLoop: true,
      spaceMode: false,
      normalWidget: Container(
        width: 10,
        height: 10,
        color: Colors.red,
      ), //自定义 选中指示器
      selectorWidget: Container(
        width: 10,
        height: 10,
        color: Colors.black38,
      ),
      //轮播的item  widget 必传
      getwidget: (index) {
        return new GestureDetector(
            child: Image.network(
              bannerList[index % bannerList.length],
              fit: BoxFit.contain,
            ),
            onTap: () {
              //点击后todo
            });
      },
    );
  }
}
