import 'package:flutter/cupertino.dart';
import 'package:one_project/TestPages/MethodsPage.dart';

class AppleStyleViewController extends StatefulWidget {
  @override
  _AppleStyleViewControllerState createState() => _AppleStyleViewControllerState();
}

class _AppleStyleViewControllerState extends State<AppleStyleViewController> {
  final rightBtn = CupertinoButton(
      child: Text('导航栏右侧按钮', style: TextStyle(fontSize: 12.0, color: CupertinoColors.black)),
      onPressed: () {
        print("right clicked");
      },
    );
  final leftBtn = CupertinoButton(
      child: Text('导航栏左侧按钮', style: TextStyle(fontSize: 12.0, color: CupertinoColors.black)),
      onPressed: () {
        print("left clicked");
      },
    );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS App By Flutter"),//标题栏
        leading: leftBtn,//左侧按钮
        trailing: rightBtn,//右侧按钮
        border: Border.all(width: 1.0, color: CupertinoColors.white),
      ),
      child: Container(
        color: CupertinoColors.destructiveRed,
      ),
    );
  }
}