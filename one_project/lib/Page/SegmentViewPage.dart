import 'package:flutter/material.dart';
import 'package:segment_control/segment_control.dart';
import 'package:one_project/Widget/yzj_segment_control.dart';
import 'package:english_words/english_words.dart';

class SegmentViewPage extends StatefulWidget {
  @override
  _SegmentViewPageState createState() => _SegmentViewPageState();
}

class _SegmentViewPageState extends State<SegmentViewPage> {
  // segment 下方的page视图
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
				// Here we take the value from the MyHomePage object that was created by
				// the App.build method, and use it to set our appbar title.
				title: Text('segmentControl'),
			),
      // color: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            YZJSegmentControl(
              tabs: ["应用消息", "版本更新"],
              selected: (index, title) {
							  print('选择了第:$index 个$title');
							  setState(() {
              });
            }),
            // new PageView(
            //   controller: _pageController,
            //   children: <Widget>[
            //     new SegmentControl(),
            //     new SegmentControl(),
            //   ],
            //   onPageChanged: (index) {
            //     print('滚动在第:$index 个page');
            //   },
            // ),
          ],
        ), 
      ),
      
    );
  }
}

class SegmentPageController extends StatefulWidget {
  @override
  _SegmentPageControllerState createState() => _SegmentPageControllerState();
}

class _SegmentPageControllerState extends State<SegmentPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              WordPair.random().toString(),
            ),
          ],
        ),
      ),
    );
  }
}