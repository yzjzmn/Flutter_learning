import 'package:flutter/material.dart';
import 'dart:ui';

// https://flutterchina.club/flutter-for-ios/#views
// flutter中文网示例

// 初始化一个SampleAppPage
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

// 在 iOS 上更新 views，只需要直接改变它们就可以了。
// 在 Flutter 中，widgets 是不可变的，而且不能被直接更新。
// 你需要去操纵 widget 的 state。

// VSCode显示所有函数列表 shift+command+o

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
      onPressed: _buildInTypes,
      child: Text('Toggle Two'),
      );
    }
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




  /// Action 
  ///  

  // 类似于返回值Void方法  
  _buildInTypes() {
      //😂😂😂用VSCode写着好难受

      _typeOfNumber();
      _typeOfString();
      _typeOfBool();
      _typeOfList();
      _typeOfMaps();
      _typeOfOthers();
      
      _theOperators();
      _theProcessControl();

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
    print('**********Maps类型 **********');
    print(DateTime.now());

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
       2:   'helium',
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

    //操作符
  _theOperators() {
    // 操作符
    // 操作符的优先级,参考:https://www.jianshu.com/p/fdd046a6dc82

    // 算术操作符:
    // 关系操作符:

    // 类型比较符:
    // as is is!
    // is操作，用来比较前操作数是否是后操作数的对象
    // as操作，用来将前操作数指定为后操作数的类型

    // 指定操作符
    // =操作符，将后操作数的值赋给前操作数
    // ??=操作符，如果前操作数是null类型，则将后操作数赋值给前操作数；如果前操作数不等于null,则保持前操作数的值发生变化

    // 组合指定操作符
    // Dart 支持将算术操作符与=组合起来实现更复杂的功能
    var a = 2;
    a *= 3;
    assert(a==6);

    // 逻辑操作符
    // !expr : inverts the following expression (changes false to true, and vice versa)
    // &&    : logical AND

    // 逻辑操作符实例:
    // if (!done && (col == 0 || col == 3)) {
      // ...Do something...
    // }

    /// 位操作符及位移操作符
    /// Dart 针对整数(int 类型)支持位操作符及位移操作符
    final value = 0x22;
    final bitmask = 0x0f;
    assert((value & bitmask)  == 0x02);  // AND
    assert((value & ~bitmask) == 0x20);  // AND NOT
    assert((value | bitmask)  == 0x2f);  // OR
    assert((value ^ bitmask)  == 0x2d);  // XOR
    assert((value << 4)       == 0x220); // Shift left
    assert((value >> 4)       == 0x02);  // Shift right

    /// 条件表达式
    /// Dart 支持条件表达式，同时为了减少代码，也提供了简化的操作符
    /// Dart中有两种方式简化类似其它语言的if-else 功能
    
    /// 使用 ?: 表达式,举个栗子:(😓这不是三目运算嘛)
    /// condition ? expr1 : expr2
    
    /// 使用?? 表达式(和swift很像,可以用于添加默认值)
    /// 举个栗子:  expr1 ?? expr2



    /// 级联操作符(..)
    /// 通过级联操作符(..)，可以连续的操作同一对象，达到减少中间变量，减少代码的目的
    /// 如下面的例子

    /* 
    querySelector('#button') // Get an object.
    ..text = 'Confirm'   // Use its members.
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'));
    */

    // 等同于下面代码
    /*
    var button = querySelector('#button');
    button.text = 'Confirm';
    button.classes.add('important');
    button.onClick.listen((e) => window.alert('Confirmed!'));
    */

    // 另一个例子
    /*
    final addressBook = (new AddressBookBuilder()
    ..name = '哈哈'
    ..email = 'yzj@example.com'
    ..phone = (new PhoneNumberBuilder()
              ..number = '1321412'
              ..label  = 'work')
              .build())
    .build();
    */


  }

  /// 流程控制语句   和Python，Java，Swift,C++ 都有类似的操
  _theProcessControl() {
    /// if and else
    /// for loops
    /// while and do-while
    /// break and continue
    /// switch and case
    /// assert
    /// try-catch and throw
    
    // 除了常规的for 循环外，针对可以序列化的操作数，可以使用forEach() 方法。
    // 当不关心操作数的当前的下标的时候，forEach()方法是很简便的  
    // 举个栗子
    var collection = [1,2,3,4];
    for (var x in collection) {
      print(x);
    }

    // switch case 语句的前后操作数必须是相同的类型的对象实例(即使其中一个操作数属于另一个对象的子类的实例，比较操作也不行。)
    // 每一个非空的case 子句(不是case 判断语句本身，而是case 语句下面的实际操作。)最后都必须跟上break 语句
    /* 
    var command = 'OPEN';
    switch (command) {
      case 'OPEN':
      executeOpen();
      // ERROR: Missing break causes an exception!!

      case 'CLOSED':
      executeClosed();
      break;
      } 
      */

      /* 
      var command = 'CLOSED';
      switch (command) {
        case 'CLOSED': // Empty case falls through.
        case 'NOW_CLOSED':
        // Runs for both CLOSED and NOW_CLOSED.
        executeNowClosed();
        break;
        }
       */

      // 使用switch / case 语句，配合 continue 语句。可以实现类似 goto 语句的功能
      /* 
      var command = 'CLOSED';
      switch (command) {
        case 'CLOSED':
        executeClosed();
        continue nowClosed;
        // Continues executing at the nowClosed label.
        nowClosed:

        case 'NOW_CLOSED':
        // Runs for both CLOSED and NOW_CLOSED.
        executeNowClosed();
        break;
        }
       */

      /// assert 断言
      /// Exceptions 异常,Dart 提供 Exception 和 Error 类型来处理异常,自己也可以定义属于自己的异常类型
      /// Throw 用于抛出异常 throw new FormatException('Expected at least 1 section');
      /// 也可以通过 throw 语句释放任意的类型: throw 'Out of llamas!';
      
      // throw '我就随便抛出个异常看看';
      // Catch:捕获  基本用法和Python一样

    /*  
     try {
       misbehave();
       } catch (e) {
         print('main() finished handling ${e.runtimeType}.');
       }
     */
      

  /// Finally  Dart 的finally用来执行那些无论异常是否发生都执行的操作
  /// try {
  /// breedMoreLlamas();
  /// } catch(e) {
  ///   print('Error: $e');  // Handle the exception first.
  /// } finally {
  ///   cleanLlamaStalls();  // Then clean up.
  /// }
  
  /*
    final foo = '222';
      void misbehave() {
        try {
          // foo = "You can't change a final variable's value.";
          // 因为不能修改,这样写编译会出问题
          } catch (e) {
            print('misbehave() partially handled ${e.runtimeType}.');
            rethrow; // Allow callers to see the exception.
          }
         }
  */
  }

  /// 对象
  _theDartObject() {
    // Dart 是一种面向对象的语言，并且支持基于mixin的继承方式
    // Dart 语言中所有的对象都是某一个类的实例。所有的类有同一个基类--Object。
    // 基于mixin的继承方式具体是指：一个类可以继承自多个父类。
    //  使用new语句来构造一个类。 
    // 构造函数的名字可能是ClassName，也可以是ClassName.identifier
      
      
      /*
      var jsonData = JSON.decode('{"x":1, "y":2}');
      // Create a Point using Point().
      var p1 = new Point(2, 2);

      // Create a Point using Point.fromJson().
      var p2 = new Point.fromJson(jsonData);
      */

      // .(dot)调用实例变量或方法  点语法

      // ?. 确认前操作数不为空  常用来代替.  
      // If p is non-null, set its y value to 4.
      // p?.y = 4;

      // 使用const替代new来创建编译时的常量构造函数
      // var p = const ImmutablePoint(2, 2);

      // 使用runtimeType方法，在运行中获取对象的类型。该方法将返回Type 类型的变量  😮这个有点厉害
      // print('The type of a is ${a.runtimeType}')


      /// 实例变量
      /// 在类定义中，所有没有初始化的变量都会被初始化为null
      /// class Point {
      ///   num x; // Declare instance variable x, initially null.
      ///   num y; // Declare y, initially null.
      ///   num z = 0; // Declare z, initially 0.
      ///   }
      /// 
      /// 类定义中所有的变量Dart 语言都会隐式的定义 setter 方法，针对非空的变量会额外增加 getter 方法
 
      /// 
  }
}




/// 构造函数(Constructors) 
/// 声明一个和类名相同的函数，来作为类的构造函数。
class  Point {
  num x;
  num y;
  
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}

// this关键字指向了当前类的实例, 上面的代码可以简化为:
class PointA {
  num x;
  num y;

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  PointA(this.x, this.y);
}

// 工厂构造函数(Factory constructors)
// factory 关键字的功能，当实现构造函数但是不想每次都创建该类的一个实例的时候使用。
class Logger {
  final String name;
  bool mute =false;

  // _cache is library-private, thanks to the _ in front
  // of its name.
  static final Map<String, Logger> _cache = <String, Logger> {};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] =logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

// void main() {

//  var p1 = new Logger("1");
//  p1.log("2"); //输出2

//  var p2 = new Logger("11");
//  p2.log("21"); //输出21

// }