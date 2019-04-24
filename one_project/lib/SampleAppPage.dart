import 'package:flutter/material.dart';
// https://flutterchina.club/flutter-for-ios/#views
// flutter中文网示例

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
  
  // TODO:这里有疑问,_toggle方法执行,然后判断toggle去选择加载Text或者 FloatingActionButton
  // return FloatingActionButton, 然后button的方法_buildInTypes也执行了
  // 暂时搞不懂为什么,return 后面的是一个函数整体?不是一个对象,所以onPressed也执行了吗

  // 类似于返回值Void方法  
  _buildInTypes() {
      //😂😂😂用VSCode写着好难受

      _typeOfNumber();
      _typeOfString();
      _typeOfBool();
      _typeOfList();
      _typeOfMaps();
      _typeOfOthers();
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
      print(validConstString);
  }

  // Bool类型
  _typeOfBool() {
    print("**********Bool类型**********");
    // Dart 的布尔类型名字是bool，可能的取值包括”ture“ 和 ”false“。
    // ”bool“ 类型是 compile-time 的常量。
    // Dart 是强bool 类型检查，只有bool 类型的值是”true“ 才被认为是true。

    // eg:
    // var name = 'Bob';
    // if (name) {
      // 在别的语言中会进入这个判断,但是Dart会报异常 (必须补全写成:if name != null)
      // 在production mode 中上面的代码将不会输出任何东西，因为name != true。
      // checked mode 中上面的代码将会出现异常，因为name不是bool 类型。
      // }
  }

  // List类型
  _typeOfList() {
    print("**********List类型**********");
    // 在 Dart　语言中，具有一系列相同类型的数据被称为 List 对象。
    // Dart List 对象类似JavaScript 语言的 array 对象
    var list = [1, 2, 3];
    // Dart list 对象的第一个元素的位置是0，最后个元素的索引是list.lenght - 1
    // 这里感觉和别的语言没区别
    list.insert(3, 4);
    print(list);
  }

  // Maps类型
  _typeOfMaps() {
    print("**********Maps类型**********");
    // Map　类型将keys 和 values 关联在一起。
    // keys 和 values 可以是任意类型的对象。
    // 像其它支持Map 的编程语言一样，Map 的 key 必须是唯一的。

    // 字典 也是没区别 key可以为int类型  更方便了
    // Map 对象的定义:
    var gifts = {
    // Keys      Values
    'first' : 'partridge',
    'second': 'turtledoves',
    'fifth' : 'golden rings'
    };

    var nobleGases = {
      // Keys  Values
      2 :   'helium',
      10:   'neon',
      18:   'argon',
      };
    // 也可以使用Map 对象的构造函数 Map() 来创建Map 对象:
    var gift = new Map();
    gift['first'] = 'partridge';
    gift['second'] = 'turtledoves';
    gift['fifth'] = 'golden rings';

    var nobleGase = new Map();
    nobleGase[2] = 'helium';
    nobleGase[10] = 'neon';
    nobleGase[18] = 'argon';

    // 添加新的key-value
    gift['fouth'] = 'hahah';

    // 操作和字典基本没区别

    print(gift);
    print(nobleGase);

  }

  // 其他类型
  _typeOfOthers() {
    // Runes类型
    // 可以点击 Runes 关键字到  String.dart文件中查看具体用法

    // Symbols 类型
    // 一般程序中不会使用Symbol类型,Symbol类型跟在#后面.
    // 可以点击 Runes 关键字到  String.dart文件中查看具体用法
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