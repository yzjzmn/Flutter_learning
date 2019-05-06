import 'package:flutter/material.dart';
/// 在Flutter中构建布局
/// 


class ExampleUIPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
      ),

      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/image_aj.png',
            height: 240.0,
            fit:BoxFit.fitWidth
          ),

          titleSection,
          buttonSection,
          textSection

        ],
      ),
    );

    
    /// 封装一排三个的button
    Column buildButtonColumn(IconData icon, String label) {
      Color color =Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color:color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ); 
    }


  }


  /// 封装 Widget 视图(两行字+星星+数字)
  Widget titleSection = new Container(
    color: Colors.blue,
      padding: EdgeInsets.all(16.0),
      child: new Row(// 一行显示 3个单位 Expanded  Icon Text
        children: <Widget>[
          // 封装两行字
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  color: Colors.cyan,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'not a single day goes by',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0)
                  ),
                ),
                new Text(
                    '你在说啥子呦,听不懂呀,can you speak chinese',
                    style: new TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.red)
                  ),
              ],
            ),
          ),


          new Icon(
            Icons.star,
            color:Colors.red[500]
          ),

          new Text('666')

        ],
      ),
    );

    /// 封装 Widget 视图(显示一排按钮)
    Widget buttonSection = new Container(
      color: Colors.red,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(Icons.call),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              "CALL",
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
                new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(Icons.near_me),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              "NEAR",
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
                new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(Icons.share),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              "SHARE",
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
        ],
      ),
      
    );

    /// 封装 Widget 视图(文本)
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        r'''
          迈克尔·乔丹在在1984年NBA选秀中于第1轮第3位被芝加哥公牛队选中，职业生涯曾效力于芝加哥公牛队以及华盛顿奇才队，新秀赛季当选NBA年度最佳新秀。1986-87赛季，乔丹场均得到37.1分，首次获得NBA得分王称号。1991-93赛季，乔丹连续3次荣膺常规赛MVP以及总决赛MVP（FMVP），率领芝加哥公牛队3夺NBA总冠军。1993年10月6日因父亲被害而宣布退役，两年后宣布复出。1996年入选NBA50大巨星。1996-98赛季，乔丹荣膺个人职业生涯第10次（共10次）NBA得分王以及第5次（共5次）常规赛MVP，并再次率领公牛队3夺（共6次）NBA总冠军，自己当选共第6次总决赛MVP。1999年1月13日在劳资谈判失败后再次宣布退役，两年后在华盛顿奇才队再次宣布复出。迈克尔·乔丹的职业生涯年年入选NBA全明星阵容（共14次）并3次当选NBA全明星MVP，10次入选NBA最佳阵容一阵，1985年入选NBA最佳阵容二阵，1988年荣膺NBA年度最佳防守球员，9次入选NBA最佳防守阵容一阵，3次荣膺NBA抢断王，2次夺得NBA全明星扣篮大赛冠军，1984年以及1992年夺得奥运会金牌。
2003年4月16日，迈克尔·乔丹在职业生涯最后一场奇才主场对阵76人比赛的赛后正式宣布退役 [1]  。他被认为是历史上最伟大的篮球运动员 [2]  ，2009年9月11日，迈克尔·乔丹入选奈·史密斯篮球名人纪念堂 [3]  。
人

        ''',
        softWrap: true,
        style: new TextStyle(fontSize: 16.0),
      ),
    );
    




}


 


