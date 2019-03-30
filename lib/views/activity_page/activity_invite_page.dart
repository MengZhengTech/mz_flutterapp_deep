import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/widgets/activity/invite_list_widget.dart';

class ActivityInvitePage extends StatefulWidget{
  @override
  _ActivityInvitePageState createState() => _ActivityInvitePageState();
}

class _ActivityInvitePageState extends State<ActivityInvitePage>{
  
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

              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  DecoratedBox(
                    decoration: BoxDecoration(
                      color:Color(0xffffffff),
                      boxShadow: [BoxShadow(
                        color:Color(0xffaaaaaa), 
                        offset: Offset(2.0,2.0),
                        blurRadius: 4.0
                      )],
                    ),
                    child: Container(
                      width: ScreenUtil().setWidth(750),
                      height: ScreenUtil().setHeight(138),
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(19), top: 0, left: 0, right: 0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '参与人员',
                        style:TextStyle(
                          color: Color(0xFF313131),
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),

                  Container(
                    width: ScreenUtil().setWidth(750),
                    height: getHeight(),
                    child: InviteListWidget(),
                  ),
                  
                ],
              ),      
              
              Positioned(
                top: ScreenUtil().setWidth(60),
                left: ScreenUtil().setWidth(27),
                child: Icon(Icons.arrow_back, color: Color(0xFF57CEA8), size: ScreenUtil().setWidth(43)),
              ),

              Positioned(
                top: ScreenUtil().setWidth(60),
                right: ScreenUtil().setWidth(27),
                child: 

                GestureDetector(
                  onTap: () => Application.router.navigateTo(context, '/activity/invite', transition: TransitionType.inFromBottom),
                  child: 
                  Text(
                    '邀请',
                    style: TextStyle(
                      color: Color(0xFF57CEA8),
                      fontSize: ScreenUtil().setSp(28),
                      height: 30/28
                    ),
                    softWrap: true
                  ),
                ),
                
              ),
              
            ],
          ),
        ),

      ),
    
    );

  }

  double getHeight() {
    return ScreenUtil.screenHeight - ScreenUtil().setWidth(138) - 588;
  }
  

}