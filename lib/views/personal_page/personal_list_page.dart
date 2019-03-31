import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:mz_flutterapp_deep/widgets/activity/invite_list_widget.dart';

class PersonalListPage extends StatefulWidget{
  @override
  _PersonalListPageState createState() => _PersonalListPageState();
}

class _PersonalListPageState extends State<PersonalListPage>{
  double _listHeight = 0;

  @override
  Widget build(BuildContext context) {  
    _listHeight = getHeight();
    return 
    Theme(
      data: ThemeData.light(),

      child: 
      Scaffold(
        body: 
        SingleChildScrollView(
          child: 
          
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(1334), minWidth: ScreenUtil().setWidth(750)),
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
                        gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/demo/background1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        width: ScreenUtil().setWidth(750),
                        height: ScreenUtil().setHeight(400),
                        padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(24), top: ScreenUtil().setWidth(60), left: ScreenUtil().setHeight(24), right: ScreenUtil().setHeight(110)),
                        alignment: Alignment.bottomCenter,
                        child: 
                        
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color:Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: 
                          Text('我的 页面'),
                        ),
                        
                      ),
                    ),

                    Container(
                      width: ScreenUtil().setWidth(750),
                      height: _listHeight,
                      child: InviteListWidget(),
                    ),
                    
                  ],
                ),      
                
                Positioned(
                  top: ScreenUtil().setWidth(70),
                  right: ScreenUtil().setWidth(27),
                  child: 

                  GestureDetector(
                    onTap: () => Application.router.navigateTo(context, '/activity/member', transition: TransitionType.inFromBottom),
                    child: 
                    Text(
                      '取消',
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
      ),
    
    );

  }

  double getHeight() {
    return ScreenUtil.screenHeight - ScreenUtil().setHeight(178) - 592 - 300;
  }
  
  // 用户搜索好友
  void searchFriend(String s){ 
    print(s); 
  }
}