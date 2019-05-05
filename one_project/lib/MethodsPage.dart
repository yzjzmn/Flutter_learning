import 'package:flutter/material.dart';
import 'dart:math';

/// 方法使对象公共的函数功能
 
/// getters and setters
 
/// get()和set() 方法使Dart提供的专门用来读取和写入对象的属性的方法.String
/// 每一个类的实例,系统都隐式的包含有get()和set()方法
/// get()和set()的例子


class Rectangle {
  num left;
  num top;
  num width;
  num height;
  
  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value)  => left = value - width;

  num get bottom => top + height;
  set bottom(num value)  => top = value - height;

}

main() {
  var rect = new Rectangle(5, 10, 20, 30);
  assert(rect.left == 5);
  rect.right = 12;
  assert(rect.left == -3);
}

/// 抽象方法(Abstract methods)
/// 抽象方法类似与Java语言中的interface 的概念。在当前不具体的实现方法，只是写好定义接口，具体实现留着调用的人去实现。
/// 可以使用abstract关键字定义抽象方法。
abstract class Doer {
  // ...Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {

  }
}

// 如果定义矢量的话，可以定义+ 方法我操作两个矢量的实例
// 下面的例子就是重载了+ 和-操作的例子
class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  /// Overrides + (a + b).
  Vector operator + (Vector v) {
    return new Vector(x+v.x, y+v.y);
  }
  
  /// Overrides - (a - b).
  Vector operator - (Vector v) {
    return new Vector(x-v.x, y-v.y);
  }
}

mainVector() {
  final v = new Vector(2,3);
  final w = new Vector(2,2);

  assert(v.x == 2 && v.y == 3);

  //v + w = (4,5)
  assert((v+w).x==4 && (v+w).y==5);

  //v - w = (0,1)
  assert((v-w).x==4 && (v-w).y==5);

  // 如果重载了==，同时也需要重载对象的hashCode的get() 方法
  
}

  /// 抽象类（Abstract classes）
  /// 使用abstract 关键字定义一个抽象类，抽象类是不能实例化的。
  /// 抽象类通常用来定义接口
  /// 假如需要将抽象类实例化，需要定义一个factory constructor
  /// 下面是包含抽象方法的例子

  // This class is declared abstract and thus
  // can't be instantiated.
abstract class AbstractContainer {
  // ...Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

class SpecializedContainer extends AbstractContainer {
  // ...Define more constructors, fields, methods...

  void updateChildren() {
    // ...Implement updateChildren()...
  }

  // Abstract method causes a warning but
  // doesn't prevent instantiation.
  void doSomething() {

  }
}

/// 扩展类(Extending a class)
class Television {
  void turnOn() {
    // doSomething1();
    // doSomething2();
  }
  // ...
}

// 子类可以重载实例的方法，getters，setter。
// 可以使用override关键字来注释这个重载的方法
class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    // doSomething1();
    // doSomething2();
    // doSomething3();
  }
  // ...
}

/// 枚举类型(Enumerated types)
/// 枚举类型是一种特殊的类，通常用来表示相同类型的一组常量值。
/// 每个枚举类型都用于一个index的getter，用来标记元素的元素位置。第一个枚举元素的标是0 。

enum Color {
  red,//red.index == 0;
  green,//green.index == 1;
  blue//blue.index == 1;
}
// 获取枚举类中所有的值，使用value常数
List<Color> colors =Color.values;

// 枚举类型不能继承，实例化



//---------------------------------------
// 使用’mixins‘ 功能给类添加新的功能
// mixins是一种方便重用一个类的代码的方法。
// 使用with 关键字来实现mixins的功能。

// with用法的实例
/* 
class Musician extends Performer with Musical {
  // ...
}
class Maestro extends Person with Musicial, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
*/

/// 类变量和方法(Class variables and methods)
/// 使用static关键字来使用类范围内的变量及方法
/// 
/// 类常量
/// 类常量的作用范围是类的内部。
/// 类常量只有在被使用的时候才会被调用

class ColorA {
  static const red =
      const ColorA('red'); // A constant static variable.
  final String name;      // An instance variable.
  const ColorA(this.name); // A constant constructor.
}

mainColor() {
  assert(ColorA.red.name == 'red');
}


/// 类方法

class Point {
  num x;
  num y;
  Point(this.x, this.y);

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
} 

mainpOint() {
  var a =new Point(2, 2);
  var b =new Point(5, 6);
  var distance = Point.distanceBetween(a, b);
  assert(distance == 5);
}


///////////////////////////////////
///   异步(Asynchrony support)  ///
///////////////////////////////////
/// Dart 语言是目前少数几个支持异步操作的语言。
/// 一般使用async函数和await表达式实现异步操作
/// 'asynchronous '功能
//  Dart 库提供asynchronous的功能
//  该功能提供接口来进行耗费时间的操作，二调用的主代码不用等待耗时操作执行完成后才进行操作。该功能返回Future或Stream对象

// 可以通过如下的方式来获取asynchronous功能返回的Future对象的值。

// 使用async函数和await表达式。
// 使用Future功能提供的API。

// 可以通过如下的方式来获取asynchronous 功能返回的Stream `对象的值。

// 使用async 和一个异步的循环(await for)。
// 使用Stream的相关API。

/// 代码使用了async或await就是异步处理，虽然代码看起来像是同步处理的
// await lookUpVersion()

// 必须在一个使用了async关键字标记后的函数中来使用await表达式
  
  // checkVersion() async {
  //   var version = await lookUpVersion();
  //   if (version == expectedVersion) {
  //     // Do something.
  //   } else {
  //     // Do something else.
  //   }
  // }

// await表达式可以与try，catch和finally语句搭配在一起使用。
// try {
//   server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4044);
// } catch (e) {
//   // React to inability to bind to the port...
// }
