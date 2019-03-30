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
                        color:Color(0xffffffff),
                        border: Border(
                          bottom: BorderSide(width: ScreenUtil().setWidth(2), color: Color(0xFFDCDCDC)),
                        ),
                      ),
                      child: Container(
                        width: ScreenUtil().setWidth(750),
                        height: ScreenUtil().setHeight(178),
                        padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(24), top: ScreenUtil().setWidth(60), left: ScreenUtil().setHeight(24), right: ScreenUtil().setHeight(110)),
                        alignment: Alignment.bottomCenter,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color:Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: 
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                filled: false,
                                fillColor: Color(0xFFEBEBEB),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search, color: Color(0xFF959595), size: ScreenUtil().setWidth(38)),
                                hintText: "搜索好友",
                                hintStyle: TextStyle(color: Color(0xFF959595), fontSize: ScreenUtil().setSp(28), height: 1),
                                contentPadding:EdgeInsets.only(left:ScreenUtil().setWidth(8), right:ScreenUtil().setWidth(6), top:ScreenUtil().setWidth(14), bottom:ScreenUtil().setWidth(2)),
                            ),
                            style:TextStyle(
                              color: Color(0xFF1B1B1B), fontSize: ScreenUtil().setSp(32), height: 1
                            ),
                            scrollPadding: const EdgeInsets.all(.0), 
                            onChanged: searchFriend,
                          )
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
    return ScreenUtil.screenHeight - ScreenUtil().setHeight(178) - 592;
  }
  
  // 用户搜索好友
  void searchFriend(String s){ 
    print(s); 
  }
}