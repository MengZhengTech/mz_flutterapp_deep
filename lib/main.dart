/**
 * app 入口文件
 */
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/routers/routers.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';


class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'DEEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new LoginPage(),
      initialRoute: Routes.login, // 初始路由
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");

    return app;
  }
}

void main() { // async
  runApp(new MyApp());
  if (Platform.isAndroid) { // 设置状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}