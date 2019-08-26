import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:one_project/Util/event_util.dart';
import 'package:one_project/App/app_constant.dart';
import 'package:one_project/Util/screen.dart';
import 'package:one_project/Page/andriod/home_menu_page.dart';

// 类似于 OC的 .h文件  
class VideoWidget extends StatefulWidget {

  final String url;
  final String previewImgUrl; //预览图片的地址
  final bool showProgressBar; //是否显示进度条
  final bool showProgressText; //是否显示进度文本
  final int positionTag;

  VideoWidget(this.url,
      {Key key,
      this.previewImgUrl: '',
      this.showProgressBar = true,
      this.showProgressText = true,
      this.positionTag})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

// 类似于OC 的.m文件
class _VideoWidgetState extends State<VideoWidget> {
    VideoPlayerController _controller;
  bool _hideActionButton = true;
  bool videoPrepared = false; //视频是否初始化

  // 类似于 init方法
  @override
  void initState() {
    super.initState();
    eventUtil.on(EventVideoPlayPosition + widget.positionTag.toString(), (arg) {
      if (arg == widget.positionTag) {
        _controller.play();
        videoPrepared = true;
      } else {
        _controller.pause();
      }
      setState(() {});
    });

    _controller = VideoPlayerController.asset(widget.url)
      ..initialize()
      ..setLooping(true).then((_) {
        // if (widget.positionTag == 0 && HomeMenuPage.firstInitTimes == 1) {
        //   HomeMenuPage.firstInitTimes = 2;
        if (widget.positionTag == 0) {
          _controller.play();
          videoPrepared = true;
        }
        setState(() {});
      });
  }

  //类似dealloc方法
  @override
  void dispose() {
    super.dispose();
    eventUtil.off(EventVideoPlayPosition + widget.positionTag.toString());
    _controller.dispose(); //释放播放器资源
  }

  // 预览图片
  Widget getPreviewImg() {
    return Offstage(
        offstage: videoPrepared,
        child: Image.asset(
          widget.previewImgUrl,
          fit: BoxFit.cover,
          width: Screen.width,
          height: Screen.height,
        ));
  }

  // 暂停View
  getPauseView() {
    return Offstage(
      offstage: _hideActionButton,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
                child: Image.asset('images/ic_playing.png'),
                height: 50,
                width: 50),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

  // 左侧文案
  getLeftActionView() {
    return Positioned(
      child: Container(
          width: Screen.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "奔驰G级AMG",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "@没那么简单",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "最爱大奔",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(height: 8),
                      ]),
                ),
                Container(width: Screen.height, height: 1, color: Colors.white),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "点赞是鼓励，评论才是真爱...",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                    height: 50),
              ])),
      bottom: 0,
    );
  }

  // 类似于viewDidLoad方法
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GestureDetector(
        child: Stack(
          children: <Widget>[
            VideoPlayer(_controller),
            getPauseView(),
          ],
        ),
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
            _hideActionButton = false;
          } else {
            _controller.play();
            videoPrepared = true;
            _hideActionButton = true;
          }
          setState(() {});
        },
      ),
      getPreviewImg(), // 预览图
      getLeftActionView(), // 左侧文案
    ]);
  }
}