import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 新建一个 page  默认有3种方式
// Flutter Stateful widget  
// Flutter Stateless widget 
// Flutter widget with AnimationController

/// stateful组件就是和用户交互后会有状态变化，例如滚动条Slider
/// stateless组件就是交互后没有状态变化，例如显示的一个文本Text
/// 参考:http://tryenough.com/flutter05


/// 一个.dart文件  可以写多个page  这点也和OC很像
/// 相当于多个类在一个.dart文件  
/// 从架构层面不建议这么做,有些场景可以这样去实现,例如定制的subview无需复用

/// 可以看做OC的.h方法声明
class BuildViewPage extends StatefulWidget {
  @override
  _BuildViewPageState createState() => _BuildViewPageState();
}

/// 看做OC的.m方法实现
class _BuildViewPageState extends State<BuildViewPage> {
  
  // 可以看做OC的ViewDidLoad方法
  @override
  Widget build(BuildContext context) {
    return setUpUIView();
  }

  /// UI布局  返回一个 Scaffold
  Scaffold setUpUIView() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一个UI界面'),
      ),
      body: new Center(//都可以做拆分的,UI布局拆分
      //这是一个IOS风格材质的按钮，需要导入cupertino文件才能引用
      child: new CupertinoButton(
          color: Colors.red,
          child: Text('跳转到下一个页面'),
          onPressed: (){//这里可以拆分函数,不然这种嵌套太多代码太难读了
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new PushSecondViewController(
                  title: '第二个页面',
                )
              ) 
            );
          },
        ),  
      ),
    );
  }



/** ====================Action分割线===================== */
  // 用来实现 Action (类似于实现代理方法的地方)

/// TODO:暂不清楚 拆分出去的_pushToNextPageAction方法不能使用,编译器来会报错
/*
 'package:flutter/src/widgets/navigator.dart': Failed assertion: line 2176 pos 12: '!_debugLocked':
flutter: is not true.
flutter:
flutter: Either the assertion indicates an error in the framework itself, or we should provide substantially
flutter: more information in this error message to help you determine and fix the underlying cause.
flutter: In either case, please report this assertion by filing a bug on GitHub:
flutter:   https://github.com/flutter/flutter/issues/new?template=BUG.md
 */

  // _pushToNextPageAction() {
  //   Navigator.push(
  //             context,
  //             new MaterialPageRoute(
  //               builder: (context) => new PushSecondViewController(
  //                 title: '第二个页面',
  //               )
  //             ) 
  //           );
  // }


}

/** ====================页面Page分割线===================== */
class PushSecondViewController extends StatelessWidget {
  // 相当于重写 初始化方法  传入一个title的参数
  PushSecondViewController({Key key, this.title}) :super(key:key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
          child: new Image.asset("images/image_kb.png")  //路径要写全
        ),
    );
  }
}


