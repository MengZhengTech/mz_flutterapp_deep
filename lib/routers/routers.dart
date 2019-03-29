/**
 * created by Huai 2019/3/27 0027
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/routers/router_handler.dart';

class Routes{
  static String root = "/";  // 首页  不可换其他路径
  static String login = "/login";  // 登录页
//  static String mindMap = "/mindMap";  // 心情

  // 活动页面
  static String activityList = '/activity/list';
  static String activityDetail = '/activity/detail';
  static String activityMember = '/activity/member';

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });

    // 注册页面  参数传递请写在 router_handler.dart 文件中
    router.define(root, handler: homeIndexHandler); // homeIndexHandler
    router.define(login, handler: loginHandler);
//    router.define(mindMap, handler: mindHandler);

    // 活动页面
    router.define(activityList, handler: activityListPageHandler);
    router.define(activityDetail, handler: activityDetailPageHandler);
    router.define(activityMember, handler: activityMemberPageHandler);
  }
}