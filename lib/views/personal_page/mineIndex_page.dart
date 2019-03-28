/**
 * created by Huai 2019/3/28 0028
 */
import "package:flutter/material.dart";

class MineIndexPage extends StatefulWidget{
  @override
  _MineIndexState createState() => _MineIndexState();
}

class _MineIndexState extends State<MineIndexPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("个人首页"),
      ),
      body: new Center(
        child: new Text("个人首页界面"),
      ),
    );
  }
}