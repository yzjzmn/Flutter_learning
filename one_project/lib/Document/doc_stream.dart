/*
 * 获取stream的方法
 *  1.通过构造函数
 *  2.使用StreamController
 *  3.IO Stream
 * 
 */

import 'dart:async';

import 'package:flutter/material.dart';

main(List<String> args) {
  // Stream 常用的构造方法
  Stream.fromIterable([1, 2, 3]);
  // 监听Stream的方法
  // 监听一个流最常见的方法就是listen.当事件发出时,流将会通知listener.listen方法提供了几种触发事件

  // onData(必填): 收到数据时触发
  // onError: 收到error时触发
  // onDone: 结束时触发
  // unsubscribeOnError: 遇到第一个error时是否取消订阅,默认值false

  // StreamController

  // 任意类型的流
  StreamController controller = StreamController();
  controller.sink.add(123);
  controller.sink.add('xcv');
  // controller.sink.add(Anything); 泛型定义了我们能向流上推送什么类型的数据。它可以是任何类型！

  // 创建一条处理int类型的流
  StreamController<int> numController = StreamController();
  numController.sink.add(32532);

  //监听这个流的出口，当有data流出时，打印这个data
  StreamSubscription subscription =
      controller.stream.listen((data) => print("$data")); //输出 123 xcv

  // 如果要限制这个流最多能传多少个东西,可以用take限制.比如:输入密码，我们可能想让用户最多输四次
  controller.stream.take(4);
  // take函数接收一个int，代表最多能经过take函数的事件次数。当传输次数达到这个数字时，这个流将会关闭，无法再传输

  // Stream的种类
  // "Single-subscription" streams 单订阅流
  // "broadcast" streams 多订阅流

  // 单个订阅流在流的整个生命周期内仅允许有一个listener
  // 它在有收听者之前不会生成事件，并且在取消收听时它会停止发送事件，即使你仍然在Sink.add更多事件

  controller.stream.listen((data) => print(data));
  controller.stream.listen((data) => print(data));

  controller.sink.add(123);
// 输出： Bad state: Stream has already been listened to. 单订阅流不能有多个收听者

controller.stream.asBroadcastStream().listen((data) => print(data));
controller.stream.asBroadcastStream().listen((data) => print(data));
controller.stream.asBroadcastStream().listen((data) => print(data));

controller.sink.add(12321321);// 输出三次,按照顺序
}
