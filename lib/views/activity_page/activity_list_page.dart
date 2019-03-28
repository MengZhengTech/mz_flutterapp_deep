import "package:flutter/material.dart";

class ActivityListPage extends StatefulWidget{
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('活动列表页'),
      ),
      body: new Center(
        child: new Text('活动列表页'),
      ),
    );
  }
}