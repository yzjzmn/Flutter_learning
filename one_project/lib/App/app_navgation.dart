import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 处理跳转的工具
class AppNavgation {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }


}