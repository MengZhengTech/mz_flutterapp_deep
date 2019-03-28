
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/routers/routers.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';



// import 'package:mz_flutterapp_deep/views/homeIndex_page.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

//  showPage(){
//    return HomeIndexPage();
//  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'DEEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new HomeIndexPage(),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");

    return app;
  }
}

void main() { // async
  runApp(new MyApp());
  if (Platform.isAndroid) { // 设置状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}