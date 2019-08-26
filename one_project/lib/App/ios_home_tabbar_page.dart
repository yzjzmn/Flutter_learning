import 'package:flutter/cupertino.dart';
import 'package:one_project/Page/iOS/home_page_ios.dart';
import 'package:one_project/Page/iOS/shop_mall_ios.dart';
import 'package:one_project/Page/iOS/shop_cart_ios.dart';
import 'package:one_project/Page/iOS/mine_controller_ios.dart';

class TabbarViewController extends StatefulWidget {
  @override
  _TabbarViewControllerState createState() => _TabbarViewControllerState();
}

class _TabbarViewControllerState extends State<TabbarViewController> {
  // 默认索引第一个tab
  int _tabIndex = 0;

  // 正常情况的字体样式
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  // 选中情况的字体样式
  final tabTextStyleSelect = new TextStyle(color: CupertinoColors.destructiveRed);

  // 底部菜单栏图标数组
  var tabImages;

  // 页面内容
  var _pages;

  // 菜单文案
  var tabTitles = ['首页', '产品商城', '购物车', '我的'];

  // 路由map
  Map<String, WidgetBuilder> _routes = new Map();

  // 生成image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
  
  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/Icon_Tabbar_home@2x.png'),
          getTabImage('images/Icon_Tabbar_home_seleceted@2x.png')
        ],
        [
          getTabImage('images/Icon_Tabbar_product@2x.png'),
          getTabImage('images/Icon_Tabbar_product_selected@2x.png')
        ],
        [
          getTabImage('images/Icon_Tabbar_shopCart@2x.png'),
          getTabImage('images/Icon_Tabbar_shopCart_selected@2x.png')
        ],
        [
          getTabImage('images/Icon_Tabbar_personal@2x.png'),
          getTabImage('images/Icon_Tabbar_personal_seleceted@2x.png')
        ]
      ];
    }

    _pages = [
      new HomeViewController(),
      new ShopMallViewController(),
      new ShopCartViewController(),
      new MineViewController()
    ];
  }

  //获取菜单栏字体样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelect;
    } else {
      return tabTextStyleNormal;
    }
  }

  // 获取图标
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  // 获取标题文本
  Text getTabTitle(int curIndex) {
    return new Text(
      tabTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  // 获取BottomNavigationBarItem
  List<BottomNavigationBarItem> getBottomNavigationBarItem() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // 初始化数据
    initData();
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: getBottomNavigationBarItem(),
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              child: _pages[index],
            );
          },
        );
      },
    );
  }
}
