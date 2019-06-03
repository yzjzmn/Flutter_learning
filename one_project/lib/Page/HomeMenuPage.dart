import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomeMenuPage extends StatefulWidget {
  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
        itemCount: 3,
        itemExtent: 50.0,//item高度
        itemBuilder: (context, index) {
          return new Text(WordPair.random().toString(),style: TextStyle(color: Colors.black));
        },
      ),
    );
  }
}