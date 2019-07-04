import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:video_player/video_player.dart';

class HomeMenuPage extends StatefulWidget {
  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    String videoUrl =     'https://wx3.sinaimg.cn/crop.0.0.604.339.360/006QmDx6ly1g2ia60z17lj30gs0b8q5u.jpg';
    _controller = VideoPlayerController.network(
        videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _controller.value.initialized
          // 加载成功
          ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
            )
          : Container(),
        ),
    );
  }
}