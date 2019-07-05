import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:one_project/Util/event_util.dart';
import 'package:one_project/App/app_constant.dart';
import 'package:one_project/Widget/video_widget.dart';

class HomeMenuPage extends StatefulWidget {

  static int firstInitTimes=1;

  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  SwiperController _controller =SwiperController();

  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page.floor() ==_controller.page) {
        eventUtil.emit(
          EventVideoPlayPosition + _controller.page.floor().toString(),
          _controller.page.floor(),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    HomeMenuPage.firstInitTimes = 1;
  }

  @override
  Widget build(BuildContext context) {
    // 创建20个视频数据  单双循环 本地数据
    List<Widget> children = List.generate(20, (i) => buildVideoItem(i));
    return Scaffold(
        body: Swiper(
      autoStart: false,
      circular: false,
      direction: Axis.vertical,
      children: children,
      controller: _controller,
    ));
  }

  Widget buildVideoItem(int position) {
    print(position.toString());
    if (position % 2 == 0) {
      return VideoWidget(
        "images/video_1.mp4",
        previewImgUrl: 'images/img_video_1.png',
        positionTag: position,
      );
    } else {
      return VideoWidget(
        "images/video_2.mp4",
        previewImgUrl: 'images/img_video_2.png',
        positionTag: position,
      );
    }
  }

}