/**
 * created by Huai 2019/3/27 0027
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// 系统页面
import 'package:mz_flutterapp_deep/views/homeIndex_page.dart';
import 'package:mz_flutterapp_deep/views/login_page/login_page.dart';
// import 'package:mz_flutterapp_deep/views/mind_page/mindMap_page.dart';

// 活动页面
import 'package:mz_flutterapp_deep/views/activity_page/activity_list_page.dart';
import 'package:mz_flutterapp_deep/views/activity_page/activity_detail_page.dart';
import 'package:mz_flutterapp_deep/views/activity_page/activity_member_page.dart';

var loginHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new LoginPage();
});
// 首页
var homeIndexHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new HomeIndexPage();
});

//var mindHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
//  return new MindMapPage();
//});

// 活动页面
var activityListPageHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new ActivityListPage();
});
var activityDetailPageHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new ActivityDetailPage();
});
var activityMemberPageHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new ActivityMemberPage();
});