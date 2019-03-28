/**
 * created by Huai 2019/3/28 0028
 * 聊天首页
 */
import "package:flutter/material.dart";

class ChatIndexPage extends StatefulWidget{
  @override
  _ChatIndexState createState() => _ChatIndexState();
}

class _ChatIndexState extends State<ChatIndexPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("聊天首页"),
      ),
      body: new Center(
        child: new Text("聊天首页界面"),
      ),
    );
  }
}