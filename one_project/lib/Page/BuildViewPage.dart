import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/rendering.dart';
import 'HomeMenuPage.dart';
import 'ExampleUIPage.dart';

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
    // return setUpUIView();
    return setUpButtons();
  }

  // 加载多个buton
  Scaffold setUpButtons() {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('多个按钮!'),
      ),

      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        // TODO:布局问题
        /// 这里有问题, MaterialButton设置只height的话 多个button会有间隙 
        /// 通过设置padding设置 可以达到没有间隙,但是需要计算文字的高度,然而不同字体中英文高度不等,很难达到效果
        /// 暂时不知道怎么去处理这个问题

          setUpCenter(),
          setUpCenter('Kobe'),
          setUpCenter('Replace'),
          setUpCenter('popUntil'),
          setUpCenter('跳转到Home页面'),          
        ],
        
      ),
    );

  }

  /// 构建一个按钮MaterialButton title非必要参数,不传会有默认值
  Center setUpCenter([String title = "跳转到图片"]) {
    return new Center(
      
      child: new MaterialButton(
        /// 
        height: 44.0,
        color: title == '跳转到Home页面'?Colors.blue:Colors.red,
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontFamily: 'PingFang-SC'),
        ),
        padding: EdgeInsets.fromLTRB(20, 14, 20, 15),//按钮距离里面内容的内边距
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        onHighlightChanged: (bool b){//水波纹高亮变化回调
        },
        disabledTextColor: Colors.black54,//按钮禁用时候文字的颜色
        disabledColor: Colors.black54,//按钮被禁用的时候显示的颜色
        highlightColor: Colors.yellowAccent,//点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
        splashColor: Colors.white,//水波纹的颜色
        colorBrightness: Brightness.light,//按钮主题高亮
        // elevation: 5.0,//按钮下面的阴影
        // highlightElevation: 5.0,//高亮时候的阴影
        // disabledElevation: 5.0,//按下的时候的阴影
        
        onPressed: (){
          if (title == 'Replace') {
            Navigator.replace(context, newRoute: MaterialPageRoute(
              builder: (context) => new PushSecondViewController(
                  title: title,
                )
              )
            );
          } else if (title == 'popUntil') {
            // Navigator.popUntil(context, predicate)
            /// Navigator 还有很多其它方法，如Navigator.replace、Navigator.popUntil等
            /// 详情请参考API文档或SDK源码注释
            
            Navigator.pushNamed(context, 'ExampleUIPage');

          } else if (title == 'Kobe') {
            Navigator.push(context,new MaterialPageRoute(
                builder: (context) => new PushSecondViewController(
                  title: title,
                ),
              )
            );
          }  else if (title == '跳转到Home页面') {
            Navigator.push(context, new MaterialPageRoute(
                // builder: (context) => new HomeMenuPage()
                builder: (context) => new ExampleUIPage()
              )
            );
          } else {
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new PushSecondViewController(
                title: '新的路由页面',
              ),
              fullscreenDialog: true,//类似于present的感觉,从下向上铺满
            ));
          }
                /// MaterialPageRoute的构造函数
                /// MaterialPageRoute({
                /// @required this.builder,
                /// RouteSettings settings,
                /// this.maintainState = true,
                /// bool fullscreenDialog = false,
                /// }) 
                /// builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例
                /// settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
                /// maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false
                /// fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）
              },
            ),
          );
          
  }


  /// 
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
        child: new Image.asset("images/image_kb.png")  //路径要写全  后面最好带上 package: 
        ),
    );
  }
}


