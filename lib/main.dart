
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/routers/routers.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';

import 'package:mz_flutterapp_deep/data/config.dart';
import 'package:mz_flutterapp_deep/data/net/sqflite.dart';

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

void main() async { // async
  await _isLogin();
  runApp(new MyApp());
  if (Platform.isAndroid) { // 设置状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
void  _isLogin() async{
  try{
    UserSqlite userSqlite = new UserSqlite();
    DateTime now = DateTime.now();
    await userSqlite.openSqlite();
    List<User> userList = await userSqlite.getAll();
    print(userList.length.toString());
    //await userSqlite.delete(userList.first.guid);
    if(userList.length > 0)
    {
      var user = userList.first;
      DateTime time = DateTime.parse(user.dateTime);
      if(now.isBefore(time))
      {
        Config.isLogin = true;
        time = now.add(new Duration(days:7));
        print(time.toString());
        String year = time.year.toString();
        String month = time.month>9?time.month.toString():"0" + time.month.toString();
        String day = time.day>9?time.day.toString():"0"+time.day.toString();
        user.dateTime = year+"-"+month+"-"+day;
        print(user.dateTime);
        await userSqlite.update(user);
      }
    }
    await userSqlite.close();
  }catch(e){
    print(e);
  }
  //return isLogin;
}
