/**
 * created by Huai 2019/3/24 0024
 * 首页
 */
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:mz_flutterapp_deep/widgets/bottom_navigationBar.dart';

import 'package:mz_flutterapp_deep/routers/routers.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';


class HomeIndexPage extends StatefulWidget{
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndexPage>{
  @override
  Widget build(BuildContext context) {
    // 全局设计稿尺寸初始化
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build

    return new Scaffold(
      body: new MyHomePage()
    );
  }

}
