import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityDetailPage extends StatefulWidget{
  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage>{
  
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
            
            Text('详情')
          ]
        )

      ),
    
    );

  }

  

}