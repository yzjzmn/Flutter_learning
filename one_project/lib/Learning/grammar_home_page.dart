import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_project/Util/screen.dart';

class GrammarHomePage extends StatefulWidget {
  @override
  _GrammarHomePageState createState() => _GrammarHomePageState();
}

class _GrammarHomePageState extends State<GrammarHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        constraints: BoxConstraints.expand(
          // 添加到child上额外的约束条件
          width: Screen.width,
          height: Screen.navigationBarHeight + 200,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.red),
          color: Colors.grey,
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
            image: NetworkImage(
                'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
            centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            creatButton('变量', () {}),
            creatButton('函数', () {}),
          ],
        ),
        // transform: new Matrix4.rotationZ(-0.3), //设置container的变换矩阵，类型为Matrix4。
      ),
    );
  }

  CupertinoButton creatButton(String title, onPressed) {
    return CupertinoButton(
      color: Colors.blue,
      disabledColor: Colors.blueGrey,
      child: Text(title, style: TextStyle(color: Colors.white)),
      onPressed: onPressed,
    );
  }
}
