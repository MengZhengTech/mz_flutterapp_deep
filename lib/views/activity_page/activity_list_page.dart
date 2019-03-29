import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mz_flutterapp_deep/widgets/activity/card_list_widget.dart';
import 'package:mz_flutterapp_deep/widgets/activity/header_bar_widget.dart';
import 'package:mz_flutterapp_deep/widgets/activity/image_scroll_widget.dart';

class ActivityListPage extends StatefulWidget{
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage>{
  String _place = '厦门';

  void _setPlace(String name) {
    setState(() {
      _place = name;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return 
    Theme(
      data: ThemeData.light(),

      child: 
      Scaffold(
        body: 

        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderBarWidget(title: '活动'),
            ImageScrollWidget(),
            // CardListWidget(),
          ]
        )

      ),
    
    );

  }
}