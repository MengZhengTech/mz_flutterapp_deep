import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityMemberPage extends StatefulWidget{
  @override
  _ActivityMemberPageState createState() => _ActivityMemberPageState();
}

class _ActivityMemberPageState extends State<ActivityMemberPage>{
  
  @override
  Widget build(BuildContext context) {
    
    return 
    Theme(
      data: ThemeData.light(),

      child: 
      Scaffold(
        body: 

        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment:Alignment.topCenter, 
            children: <Widget>[

              Text('memberpage')
              
            ],
          ),
        ),


      ),
    
    );

  }

  

}