// VSCode快捷键记录
// 1.快速缩进 Ctrl + [  和 Ctrl + ]
// 2.代码快速对齐,选中区域 Shift + all(option) + F][这个类似iOS control + i 很爽]

import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_project/App/home_tabbar_page.dart';

//下面是之前练习的时候写的page, 现在存在TestPage
import 'package:one_project/TestPages/BuildViewPage.dart';
import 'package:one_project/TestPages/ExampleUIPage.dart';
import 'package:one_project/TestPages/AppleStylePage.dart';
import 'package:one_project/App/ios_home_tabbar_page.dart';
import 'package:one_project/TestPages/MethodsPage.dart';
import 'package:one_project/TestPages/SampleAppPage.dart';

//专门的语法学习
import 'package:one_project/Learning/grammar_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // if (Platform.isIOS) {
    //   return CupertinoApp(
    //     title: 'iOS App By Flutter',
    //     // 主题
    //     theme: CupertinoThemeData(primaryColor: CupertinoColors.destructiveRed),
    //     // 配置 routes

    //     // roots
    //     // home: TabbarViewController(),

    //     // 学习
    //     home: GrammarHomePage(),
    //   );
    // }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      /// 注册路由列表  只能在这里注册么?
      routes: {
        'MyHomePage': (context) => MyHomePage(),
        'BuildViewPage': (context) => BuildViewPage(),
        'ExampleUIPage': (context) => ExampleUIPage(),
      },
      // 通过路由名打开新路由页,要通过路由名称来打开新路由，可以使用：
      // Future pushNamed(BuildContext context, String routeName)

      /// 命名路由的优缺点
      /// 命名路由的最大优点是直观，我们可以通过语义化的字符串来管理路由
      /// 缺点：不能直接传递路由参数,如果我们使用命名参数，就必须将路由提前注册到路由表中,所以就无法动态修改参数

      //设置不同homepage

      // 设置App的 rootVC
      // home: HomeTabbarPage(),

      home: MyHomePage(title: 'Yzj的第一个flutter程序'),

      // 基础语法
      // home: SampleAppPage(),

      // Dart函数
      // home: FounctionsPage(),

      // UI
      // home: BuildViewPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red),
              //style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CountBloc {
  int _count;
  StreamController<int> _countController;

  CountBloc() {
    _count = 0;
    _countController = StreamController();
  }

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}
