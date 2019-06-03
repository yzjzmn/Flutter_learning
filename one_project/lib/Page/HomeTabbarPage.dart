import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'HomeMenuPage.dart';
import 'ExampleUIPage.dart';
import 'SegmentViewPage.dart';

class HomeTabbarPage extends StatefulWidget {
  @override
  _HomeTabbarPageState createState() => _HomeTabbarPageState();
}

_renderTab(icon, text) {
  return new Tab(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
    ),
  );
}

class _HomeTabbarPageState extends State<HomeTabbarPage> with SingleTickerProviderStateMixin{

  List<Widget> tabs = [
      _renderTab(Icons.home, '首页'),
      _renderTab(Icons.message, '消息'),
      _renderTab(Icons.person, '个人中心')
  ];

  TabController _tabController;

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 3);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _onTabChange();

      }
    });
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbar'),
      ),

      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new HomeMenuPage(),
          new ExampleUIPage(),
          new SegmentViewPage()
        ],
      ),

bottomNavigationBar: Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(-1.0, -1.0),
                ),
              ],
            ),
            child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,//指示器宽度样式
                indicatorColor: Theme.of(context).primaryColor,
                indicatorWeight: 3.0,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: tabs),
          ),
        ),
      ),    );
  }
}