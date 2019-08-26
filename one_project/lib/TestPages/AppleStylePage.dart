import 'package:flutter/cupertino.dart';
import 'package:one_project/TestPages/MethodsPage.dart';

class AppleStyleViewController extends StatefulWidget {
  @override
  _AppleStyleViewControllerState createState() => _AppleStyleViewControllerState();
}

class _AppleStyleViewControllerState extends State<AppleStyleViewController> {
  final rightBtn = CupertinoButton(
      child: Text('确定'),
      onPressed: () {
        print("right clicked");
      },
    );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS App By Flutter"),
        trailing: rightBtn,
        border: Border.all(width: 0, color: CupertinoColors.white),
      ),
      child: Container(
        color: CupertinoColors.destructiveRed,
      ),
    );
  }
}