import 'package:flutter/material.dart';
import 'package:one_project/Widget/yzj_segment_control.dart';
import 'package:english_words/english_words.dart';
import 'dart:ui';

class SegmentViewPage extends StatefulWidget {
  @override
  _SegmentViewPageState createState() => _SegmentViewPageState();
}

class _SegmentViewPageState extends State<SegmentViewPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(
			// 	// Here we take the value from the MyHomePage object that was created by
			// 	// the App.build method, and use it to set our appbar title.
			// 	title: Text('segmentControl'),
			// ),
      // color: Colors.white,
      child:YZJSegmentControl(
        segmentHeight: 50.0,//
        normalTitleFontsize: 15.0,
        activeTitleFontsize: 15.0,

        tabs: ["应用消息", "版本更新"],
        pages: [new SegmentPageController(text: 'dsd'),
                new SegmentPageController()],
        pagesHeight: MediaQuery.of(context).size.height-MediaQueryData.fromWindow(window).padding.top-MediaQueryData.fromWindow(window).padding.bottom-kToolbarHeight-65-50,
        selected: (index, title) {
				  setState(() {            
          });
        }
      ),
    );
  }
}

class SegmentPageController extends StatefulWidget {
  @override
  SegmentPageController({Key key, this.text}) :super(key:key);
  final String text;

  _SegmentPageControllerState createState() => _SegmentPageControllerState();
}

class _SegmentPageControllerState extends State<SegmentPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.text!=null?Colors.red:Colors.green,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              WordPair.random().toString(),style: TextStyle(color: Colors.white, fontSize: 44.0),
            ),
          ],
        ),
      ),
    );
  }
}