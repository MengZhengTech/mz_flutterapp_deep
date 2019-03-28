/**
 * created by Huai 2019/3/27 0027
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// 系统页面
import 'package:mz_flutterapp_deep/views/homeIndex_page.dart';
import 'package:mz_flutterapp_deep/views/login_page/login_page.dart';
// import 'package:mz_flutterapp_deep/views/mind_page/mindMap_page.dart';

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

