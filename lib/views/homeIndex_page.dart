/**
 * created by Huai 2019/3/24 0024
 * 首页
 */
import "package:flutter/material.dart";
import 'package:mz_flutterapp_deep/widgets/bottom_navigationBar.dart';

class HomeIndexPage extends StatefulWidget{
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndexPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new MyHomePage()
    );
  }
}
