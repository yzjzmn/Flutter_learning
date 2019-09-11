import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnVariablesPage extends StatefulWidget {
  @override
  _LearnVariablesPageState createState() => _LearnVariablesPageState();
}

class _LearnVariablesPageState extends State<LearnVariablesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '',
        middle: Text('变量'),
        trailing: CupertinoButton(
          child: Text('按钮', style: TextStyle(color: Colors.red, fontSize: 13),),
          onPressed: (){
            testList();
          },
        ),
      ),
      child: ListView(
        children: <Widget>[cellItems1(), cellItems2()],
      ),
    );
  }

  // 基本数据类型
  Column cellItems1() {
    return Column(
      children: <Widget>[
        Text('''在类型安全的Dart代码中，由于变量类型可推断，大多数变量不需要显式类型,未初始化的变量的初始值为null''',
            style: TextStyle(fontSize: 15, color: Colors.grey)),
        Text(''' 
        var name = "Voyager I";
        var year = 1977;
        var antennaDiameter = 3.7;
        var flybyObjects = ["小明", "莉莉", "露西"];
        image = {
          "tags":["大图"],
          "url":"http:aliyun.image.com"
          };
          ''', style: TextStyle(fontSize: 15, color: Colors.grey)),
        Text('''final,可以限制继承,静态变量必须有初始值''',
            style: TextStyle(fontSize: 15, color: Colors.grey)),
        Text(''' 
        const关键字是隐式的，不需要写，也不应该写.const关键字不只是声明常数变量。您还可以使用它来创建常量值，以及声明创建常量值的构造函数。任何变量都可以具有常量值。
          ''', style: TextStyle(fontSize: 15, color: Colors.grey))
      ],
    );
  }

  // const
  Column cellItems2() {
    return Column(
      children: <Widget>[
        Text('''Dart语言特别支持以下类型：''',
            style: TextStyle(fontSize: 15, color: Colors.black)),
        Text('''
        numbers
        strings
        booleans
        lists (also known as arrays)
        sets
        maps
        runes (for expressing Unicode characters in a string)
        symbols
        ''',
            style: TextStyle(fontSize: 15, color: Colors.grey)),
      ],
    );
  }


  // function
  testList() {
    var list = [1,2,3];
    list[1] = 1;
    print(list);
  }

}
