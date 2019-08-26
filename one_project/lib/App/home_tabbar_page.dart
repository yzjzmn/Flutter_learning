import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_project/Page/andriod/home_menu_page.dart';
import 'package:one_project/Page/andriod/message_home_page.dart';
import 'package:one_project/Page/andriod/follow_view_page.dart';
import 'package:one_project/Page/andriod/mine_view_page.dart';

import 'package:flutter/services.dart';

class HomeTabbarPage extends StatefulWidget {
  @override
  _HomeTabbarPageState createState() => _HomeTabbarPageState();
}

_renderTab(text) {
  return new Tab(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //children可配置tabbar内容,目前只布局了文字
      children: <Widget>[new Text(text)],
    ),
  );
}

class _HomeTabbarPageState extends State<HomeTabbarPage> with SingleTickerProviderStateMixin{

  List<Widget> tabs = [
      _renderTab('首页'),
      _renderTab('产品商城'),
      _renderTab('购物车'),
      _renderTab('我的')
  ];

  TabController _tabController;

  // void _onTabChange() {
  //   if (this.mounted) {
  //     this.setState(() {
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //这里创建_tabController的时候  设置length要和tabbars的个数相等,配置成对应的数组最好
    _tabController = TabController(initialIndex: 0, vsync: this, length: 4);

    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    //     _onTabChange();

    //   }
    // });
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final SystemUiOverlayStyle _style =SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(_style);

    //默认不需要导航栏 
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),//配置是否可滚动
        children: <Widget>[
          HomeMenuPage(),
          FollowViewPage(),
          MessageHomeViewPage(),
          MineHomeViewPage(),
        ],
      ),

        bottomNavigationBar: Material(
          // color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
          color: Colors.black, //底部导航栏主题颜色
          child: SafeArea(
            child: Container(
              height: 46.0,
              decoration: BoxDecoration(
                // color: const Color(0xFFF0F0F0),
                color: Colors.black,
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //     color: const Color(0xFFd0d0d0),
                //     blurRadius: 3.0,//圆角
                //     spreadRadius: 2.0,//阴影
                //     offset: Offset(-1.0, -1.0),//阴影offset
                //   ),
                // ],
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,//指示器宽度样式
                indicatorColor: Colors.white,//指示器的颜色
                indicatorWeight: 3.0,//指示器的高度,必须大于0.0
                labelColor: Colors.white,//文字选中的颜色
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: tabs),
          ),
        ),
      ),
    );
  }
}