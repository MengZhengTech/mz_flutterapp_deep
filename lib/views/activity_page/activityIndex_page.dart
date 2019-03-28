/**
 * created by Huai 2019/3/28 0028
 */
import "package:flutter/material.dart";

class ActivityIndexPage extends StatefulWidget{
  @override
  _ActivityIndexState createState() => _ActivityIndexState();
}

class _ActivityIndexState extends State<ActivityIndexPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("活动首页"),
      ),
      body: new Center(
        child: new Text("活动首页界面"),
      ),
    );
  }
}