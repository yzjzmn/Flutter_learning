import 'package:flutter/material.dart';
// https://flutterchina.club/flutter-for-ios/#views
// flutter中文网示例工程

// 初始化一个SampleAppPage
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

// 在 iOS 上更新 views，只需要直接改变它们就可以了。
// 在 Flutter 中，widgets 是不可变的，而且不能被直接更新。
// 你需要去操纵 widget 的 state。
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;

  // 这里通过外部触发_toggle方法 变更State下的bool
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  // 区分加载Text 或者 FloatingActionButton
  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return FloatingActionButton(
        onPressed: _buildInTypes(),
        child: Text('Toggle Two'),
      );
    }
  }
  
  // TODO:这里有疑问,_toggle方法执行,然后判断toggle 
  // return FloatingActionButton, 然后button的方法_typeString也执行了
  // 暂时搞不懂为什么,return 后面的是一个函数整体?不是一个对象,所以onPressed也执行了吗

  // 类似于返回值Void方法  
  _buildInTypes() {
      //😂😂😂用VSCode写着好难受,没有段落自动对齐么,类似于Xcode那种option+i的操作

      _typeOfNumber();
      _typeOfString();

  }

  // Number类型
  _typeOfNumber() {
      print("**********Number类型**********");

  // Dart 类型包括如下两类

  // int
  // 取值范围：-2^53 to 2^53
  // double
  // 64 位长度的浮点型数据，符合IEEE 754 标准。

  // int 和 double 类型都是 num 类型的子类。
  // num 类型包括的操作包括： +, -, *, / 以及位移操作>>.
  // num 类型 有如下常用方法 abs(), ceil()和 floor()。完整的使用方法请参见：dart:math 包的使用说明。
  // int 类型不能包含小数点.


    // String -> int
    var one = int.parse('1');
    print(one);//打印肯定是1
    //swift中Int.init(1.2324)是ok的,上面提到了dart中int类型不能包含小数点
    assert(one==1);//这里的断言和NSAAsert还是蛮像的,少了一些参数而已
    // String -> double
    var onePointOne = double.parse('1.1');
    print(onePointOne);
    // int -> String
    String oneAsString = 3.toString();
    print(oneAsString);
    // double -> String
    String piAsString = 3.14159.toStringAsFixed(2);
    String paiString  = 3.14159.toString();
    print(piAsString+paiString);

    // num 类型按位操作的例子:
    assert((3 << 1) == 6);  // 0011 << 1 == 0110
    assert((3 >> 1) == 1);  // 0011 >> 1 == 0001
    assert((3 | 4)  == 7);  // 0011 | 0100 == 0111

    print(3 << 1);
    print(3 >> 1);
    print(3 | 4);

  }

  // Strings类型
  _typeOfString() {
      print("**********Strings类型**********");

      var s1 = 'Single quotes work well for string literals.';
      var s2 = "Double quotes work just as well.";
      var s3 = 'It\'s easy to escape the string delimiter.';
      var s4 = "It's even easier to use the other delimiter.";
      // String 类型可以使用 + 操作：
      
      // 可以使用三个‘ 或“来定义多行的String 类型
      var sn1 = '''You can create 
      multi-line strings
      like this one.''';
      print(s1+s2);
      print(sn1);

      // 可以使用r 来修饰String类型，表 表明是“raw” 类型字符串:
      var sr = r"In a raw string, even \n isn't special.";
      print(sr);

      // String 类型是 compile-time 的常量。
      // 可以在编译是才给String类型赋值。

      // These work in a const string.
      const aConstNum = 0;
      const aConstBool = true;
      const aConstString = 'a constant string';

      // These do NOT work in a const string.
      var aNum = 0;
      var aBool = true;
      var aString = 'a string';
      const aConstList = const [1, 2, 3];

      const validConstString = '$aConstNum $aConstBool $aConstString';
      // const invalidConstString = '$aNum $aBool $aString $aConstList';




  }


// 这里是page的布局
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//导航栏
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}