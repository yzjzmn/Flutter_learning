import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeMenuPage extends StatefulWidget {
  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    String videoUrl = 'http://tb-video.bdstatic.com/tieba-smallvideo-transcode/8_4871b1e9218ec13f03131176197ef53d_1.mp4';
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