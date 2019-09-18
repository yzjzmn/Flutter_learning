import 'package:flutter/material.dart';
import 'dart:async';

class BlocSceneController extends StatefulWidget {
  @override
  _BlocSceneControllerState createState() => _BlocSceneControllerState();
}

class _BlocSceneControllerState extends State<BlocSceneController> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream of bloc'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('you hit:${snapshot.data} times', style: TextStyle(fontSize: 36),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _streamController.sink.add(++_counter);
          //当我们点击FloatingActionButton时，增加计数器并通过sink将其发送到Stream；
          //事实上 注入到stream中值会导致监听它(stream)的StreamBuilder重建并 ‘刷新’计数器;
        },
      ),
    );
  }
}
