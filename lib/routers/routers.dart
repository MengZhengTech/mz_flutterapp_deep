/**
 * created by Huai 2019/3/27 0027
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/routers/router_handler.dart';

class Routes{
  static String root = "/";  // 首页  不可换其他路径
  static String mindMap = "/mindMap";  // 心情
  static String activityIndex = "/activityIndex";  // 活动
  static String chatIndex = "/chatIndex";  // 聊天
  static String mineIndex = "/mineIndex";  // 我的

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });
    // 注册页面  参数传递请写在 router_handler.dart 文件中
    router.define(root, handler: homeIndexHandler);
    router.define(mindMap, handler: mindHandler);
    router.define(activityIndex, handler: activityHandler);
    router.define(chatIndex, handler: chatHandler);
    router.define(mineIndex, handler: mineHandler);
  }
}