/**
 * created by Huai 2019/3/27 0027
 * 底部导航组件
 */
import "package:flutter/material.dart";
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mz_flutterapp_deep/widgets/fab_bottom_app_bar.dart';
// import 'package:mz_flutterapp_deep/routers/routers.dart';

import 'package:mz_flutterapp_deep/views/mind_page/mindMap_page.dart';
// import 'package:mz_flutterapp_deep/views/activity_page/activityIndex_page.dart';
import 'package:mz_flutterapp_deep/views/activity_page/activity_list_page.dart';
import 'package:mz_flutterapp_deep/views/chat_page/chatIndex_page.dart';
import 'package:mz_flutterapp_deep/views/personal_page/mineIndex_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<MyHomePage> with TickerProviderStateMixin{
  List<Widget> list = List();
  int _currentIndex = 0;

  void _selectedTab(int index) { // 跳转操作
    print(index);
    setState(() {
      _currentIndex = index;
    });
    // router.navigateTo(context, "/activity/list", transition: TransitionType.fadeIn);
  }

  @override
  void initState(){
    list
      ..add(MindMapPage())
      ..add(ActivityListPage())
      ..add(ChatIndexPage())
      ..add(MineIndexPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 定位
      floatingActionButton: CircularGradientButton(  // 按钮
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const <Color>[
            Color(0xff57CEA8),
            Color(0xff68B7D9),
          ],
        ),
        child:Icon(Icons.add),
        callback: () => print('1111')
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,  // 字体颜色
        selectedColor: Colors.red, // 选中颜色
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: '心情'),
          FABBottomAppBarItem(iconData: Icons.layers, text: '活动'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: '聊天'),
          FABBottomAppBarItem(iconData: Icons.info, text: '我的'),
        ],
        onTabSelected: _selectedTab,
      ),
      body: list[_currentIndex],
    );
  }
}

