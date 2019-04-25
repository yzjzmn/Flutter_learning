import 'package:flutter/material.dart';
// 作为前端工程师,肯定是面向UI编程的😆😆😆,只看语法会无聊,就撸了个tabbar

// BottomAppBar应该有蛮多种写法的吧

class FounctionsPage extends StatefulWidget {
  FounctionsPage({Key key}) : super(key: key);

  @override
  _FounctionsPageState createState() => _FounctionsPageState();

}

class _FounctionsPageState extends State<FounctionsPage> {
  // 相当于ViewDidLoad
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Dart函数'),
        ),
        
        body: Center(
          child: Text(r''' 感觉和大多数面向对象编程语言差不多,也比较容易接受
        Dart 是一个面向对象的语言，所以即使是函数也是对象，函数属于Function对象。
        可以通过函数来指定变量或者像其它的函数传递参数。
         ''',style: TextStyle(color: Colors.red, fontSize: 24),),
        ),

        

        floatingActionButton: FloatingActionButton(
        onPressed: _fountionsAction(),//TODO: 命令行执行reload,自动调用_fountionsAction方法 暂时不知道原因
        tooltip: 'Update Text',
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        // 设置底栏的形状，一般使用这个都是为了和floatingActionButton融合
        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形
        child: Row(
          // 里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              onPressed: (){
                
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
                ),
              ),
              IconButton(
                color: Colors.white,
                onPressed: (){

                },
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),)
          ],
        ),

      ),

    );
  }

  // Actions
  _fountionsAction() {

    print('--------------');

    var _nobleGase = {
      1 : 'one',
      2 : 'two'
    };
    // 函数实现的例子:
    // bool isNoble(int atomicNum) {
    //   return _nobleGase[atomicNum] !=null; 
    // }

    // 可以去掉形式参数数据类型和返回值的数据类型
    // 下面的例子演示了这些:
    // isNotble(atomicNum) {
    //   return _nobleGase[atomicNum] !=null;
    // }

    // 如果函数只有单个语句，可以采用简略的形式
    // bool isNobool(int atomicNum) => _nobleGase[atomicNum] !=null;

    // 函数可以有两中类型的参数:
    // 必须的参数放在参数列表的前面
    // 可选的参数跟在必须的参数后面

    // 可选的参数
    // 可以通过名字或位置个函数指定可选参数
    
    // 可选的名字参数
    // 在调用函数时，可以指定参数的名字及相应的取值，采用paramName: value的格式

    // 例如定义函数:

    /// Sets the [bold] and [hidden] flags to the values
    /// you specify.
    // enableFlags({bool enable, bool hidden}) {
    //   // ..
    // }

    // 函数调用:
    // enableFlags(enable: true, hidden: false);


    // 可选的位置参数  
    // 将参数使用[] 括起来，用来表明是可选位置参数
    // 例如下面的例子，函数定义:
    String say(String from, String msg, [String device]) {
      var result = '$from says $msg';
      if (device != null) {
        result = '$result with a $device';
      }
      return result;
    }

    // 调用函数不包含第三个参数:
    assert(say('leiting', 'byebye') == 'leiting says byebye');
    
    // 调用函数包含第三个参数:
    assert(say('leiting', 'byebye', 'haha') == 'leiting says byebye with a haha');


    /// 参数默认值
    // 可以定义包含默认位置参数或默认名字参数的函数
    // 参数的默认值必须是编译时的静态值
    // 假如定义函数时，没有指定默认的参数值，则参数值默认为null 
    // 使用冒号(:)来设置默认名字参数

    // Sets the [bold] and [hidden] flags to the values you
    // specify, defaulting to false.
    enableFlag({bool bold: false, bool hidden: false}) {
      // ...
    }
    // bold will be true; hidden will be false.
    enableFlag(bold: true);

    // bold,hidden默认值都是 false,函数调用 enableFlag(bold: true) ,结果bold=true; hidden=默认值false

    // - 使用等号(`= `)来设置默位置字参数
    String saying(String form, String msg, [String device = '开拓者牛批', String mark]) {
      var result = '$form says $msg';
      if (device !=null) {
        // 因为device有默认值,肯定不为空;
        result = '$result with a $device';
      }        // 即使device == null也可以使用$拼接吧
      if (mark !=null) {
        result = '$result in $mark mark';
      }

      return result;
    }

    print(saying('yzj', 'niubi'));//yzj says niubi with a 开拓者牛批
    print(saying('you', 'niubi', '雷霆真悲剧'));//you says niubi with a 雷霆真悲剧
    print(saying('you', 'niubi', null, '是啊'));//you says niubi in 是啊 mark   
    print(saying('you', 'niubi', '雷霆真悲剧', '是啊'));//you says niubi with a 雷霆真悲剧 in 是啊 mark
    
    // 也可以将lists 及maps类型作为默认值
    // 如下面的例子:
    doStuff({List<int> list:const[1,2,3,4],
     Map<String, String> gifts: const{'one':'cat',
                                      'two': 'dog',
                                      'three':'fish'}}) {
      print('list:  $list');
      print('gifts: $gifts');
    }

    // Use the default values for both parameters.
    doStuff();//输错默认值

    // Use the default values for the "gifts" parameter.
    doStuff(list:[4,5,6]);//list输出[4,5,6],gifls输出默认值
  
    // Don't use the default values for either parameter.
    doStuff(list: null, gifts: null);//输出 null null


    /// main() 函数
    /// 所有的APP都必须有一个main()函数,作为APP的入口
    /// main()函数返回void类型,并且包含了List<String>类型的参数

    /// main()函数不包含参数的例子:

    /// void main() {
    /// querySelector("#sample_text_id")
    /// ..text = "Click me!"
    /// ..onClick.listen(reverseText);
    /// }
    
    /// main()函数包含参数的例子:
    /// void main(List<String> arguments) {
    ///  print(arguments);

    ///  assert(arguments.length == 2);
    ///  assert(int.parse(arguments[0]) == 1);
    ///  assert(arguments[1] == 'test');
    ///  }
    
    /// 传递函数给函数
    /// 可以将函数作为参数传递给另一个函数,大部分语言都可以,也没什么不同的
    printElement(element) {
      print(element);
    }

    var listF = [1, 2, 3];

    // Pass printElement as a parameter.
    listF.forEach(printElement);

    // 也可以将函数赋值给一个变量,例如:
    var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
    print(loudify('hello'));

    /// 变量作用范围
    /// 嵌套的函数中可以访问包含他的函数中定义的变量(😅这个好像没啥亮点吧)
    var topLevel = true;
    mainSSS() {
      var insideMain = true;
      myFunction() {
        var insideFunction = true;
        nestedFunction() {
          var insideNestedFunction = true;
          assert(topLevel);
          assert(insideMain);
          assert(insideFunction);
          assert(insideNestedFunction);
        }
      }
    }

    /// 变量闭合
    /// 函数可以返回一个函数
    
    /// Returns a function that adds [addBy] to the
    /// Founction makeAdder(num addBy) {
        /// return (num i) => addBy + 1;
    /// }
    /// 
    /// var add2 = makeAdder(2);
    /// var add4 = makeAdder(4);
    /// 
    /// add2(3) == 5;
    /// add4(5) == 9;



    /// 函数返回值
    /// 所以的函数都会有返回值
    /// 如果没有指定函数返回值，则默认的返回值是null
    /// 没有返回值的函数，系统会在最后添加隐式的return 语句

  } 


}
