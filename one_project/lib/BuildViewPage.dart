import 'package:flutter/material.dart';
// 新建一个 page  默认有3种方式
// Flutter Stateful widget
// Flutter Stateless widget
// Flutter widget with AnimationController

class BuildViewPage extends StatefulWidget {
  @override
  _BuildViewPageState createState() => _BuildViewPageState();
}

class _BuildViewPageState extends State<BuildViewPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
