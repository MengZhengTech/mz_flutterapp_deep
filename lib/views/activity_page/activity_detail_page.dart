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

                  SizedBox(
                    width: ScreenUtil().setWidth(750),
                    height: ScreenUtil().setHeight(1300),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setWidth(129), bottom: ScreenUtil().setWidth(30)),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.black54, Colors.black26]),
                              borderRadius: BorderRadius.circular(6.0),
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/demo/user1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(308),
                              height: ScreenUtil().setWidth(395),
                            ),
                          ),
                        ),

                        Container(
                          width:ScreenUtil().setWidth(438),
                          alignment: Alignment.topCenter,
                          child: Text(
                            '【演唱会】张国荣全息投影演唱会，跨年演唱会第一场',
                            style: TextStyle(
                              color: Color(0xFF1B1B1B),
                              fontSize: ScreenUtil().setSp(30),
                              height: 30/24
                            ),
                            softWrap: true
                          ),
                        ),

                        Container(
                          width:ScreenUtil().setWidth(438),
                          alignment: Alignment.topCenter,
                          child: Text(
                            '￥ 280',
                            style: TextStyle(
                              color: Color(0xFF57CEA8),
                              fontSize: ScreenUtil().setSp(40),
                              fontWeight: FontWeight.bold,
                              // height: 40/40
                            ),
                            softWrap: true
                          ),
                        ),

                        Container(
                          width:ScreenUtil().setWidth(750),
                          height:ScreenUtil().setWidth(50),
                          alignment: Alignment.center,
                          child: Stack(
                            children: <Widget>[

                              Positioned(
                                left: ScreenUtil().setWidth(28),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: Icon(Icons.room, color: Color(0xFF626262), size: ScreenUtil().setWidth(28)),
                                    ),
                                    Text(
                                      '活动地点',
                                      style: TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: ScreenUtil().setSp(26),
                                        height: 30/26
                                      ),
                                      softWrap: true
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                right: ScreenUtil().setWidth(28),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '福建省厦门市集美区嘉庚体育馆',
                                      style: TextStyle(
                                        color: Color(0xFF959595),
                                        fontSize: ScreenUtil().setSp(20),
                                        height: 30/20
                                      ),
                                      softWrap: true
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: ScreenUtil().setWidth(8), bottom: 0),
                                      child: Icon(Icons.chevron_right, color: Color(0xFF959595), size: ScreenUtil().setWidth(20)),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          width:ScreenUtil().setWidth(750),
                          height:ScreenUtil().setWidth(50),
                          alignment: Alignment.center,
                          child: Stack(
                            children: <Widget>[

                              Positioned(
                                left: ScreenUtil().setWidth(28),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: Icon(Icons.access_time, color: Color(0xFF626262), size: ScreenUtil().setWidth(28)),
                                    ),
                                    Text(
                                      '活动时间',
                                      style: TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: ScreenUtil().setSp(26),
                                        height: 30/26
                                      ),
                                      softWrap: true
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                right: ScreenUtil().setWidth(56),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '3-22 本周五 15:00',
                                      style: TextStyle(
                                        color: Color(0xFF959595),
                                        fontSize: ScreenUtil().setSp(20),
                                        height: 30/20
                                      ),
                                      softWrap: true
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      
                        Container(
                          width:ScreenUtil().setWidth(750),
                          height:ScreenUtil().setWidth(50),
                          alignment: Alignment.center,
                          child: Stack(
                            children: <Widget>[

                              Positioned(
                                left: ScreenUtil().setWidth(28),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: Icon(Icons.supervisor_account, color: Color(0xFF626262), size: ScreenUtil().setWidth(28)),
                                    ),
                                    Text(
                                      '300人参与',
                                      style: TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: ScreenUtil().setSp(26),
                                        height: 30/26
                                      ),
                                      softWrap: true
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                right: ScreenUtil().setWidth(28),
                                top: .0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                                          borderRadius: BorderRadius.circular(16.0),
                                          image: DecorationImage(
                                            image: ExactAssetImage('assets/images/demo/user3.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: ScreenUtil().setWidth(32),
                                          height: ScreenUtil().setWidth(32),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                                          borderRadius: BorderRadius.circular(16.0),
                                          image: DecorationImage(
                                            image: ExactAssetImage('assets/images/demo/user1.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: ScreenUtil().setWidth(32),
                                          height: ScreenUtil().setWidth(32),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: 0, bottom: 0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                                          borderRadius: BorderRadius.circular(16.0),
                                          image: DecorationImage(
                                            image: ExactAssetImage('assets/images/demo/user2.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: ScreenUtil().setWidth(32),
                                          height: ScreenUtil().setWidth(32),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(right: ScreenUtil().setWidth(12), left: 0, top: ScreenUtil().setWidth(8), bottom: 0),
                                      child: Icon(Icons.chevron_right, color: Color(0xFF959595), size: ScreenUtil().setWidth(20)),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                 
                ],
              ),      

              Positioned(
                bottom: .0,
                left: .0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      width: ScreenUtil().setWidth(96),
                      height: ScreenUtil().setWidth(90),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(32), right: 0, top: 0, bottom: 0),
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(20), left: 0, top: 0, bottom: 0),
                      child: Text(
                        '总价',
                        style: TextStyle(
                          color: Color(0xFF535353),
                          fontSize: ScreenUtil().setSp(22),
                          height: 40/22
                        ),
                        softWrap: true
                      ),
                    ),

                    Container(
                      width: ScreenUtil().setWidth(384),
                      height: ScreenUtil().setWidth(90),
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(29), left: 0, top: 0, bottom: 0),
                      child: Text(
                        '￥ 280',
                        style: TextStyle(
                          color: Color(0xFF57CEA8),
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.bold,
                          // height: 40/40
                        ),
                        softWrap: true
                      ),
                    ),

                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[Color(0xFF57CEA8),Color(0xFF68B7D9)]), 
                        // borderRadius: BorderRadius.circular(3.0), 
                        // boxShadow: [ 
                        //   BoxShadow(
                        //       color:Colors.black54,
                        //       offset: Offset(2.0,2.0),
                        //       blurRadius: 4.0
                        //   )
                        // ]
                      ),
                      child: Container(
                        width: ScreenUtil().setWidth(270),
                        height: ScreenUtil().setWidth(90),
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(55), vertical: ScreenUtil().setWidth(20)),
                        child: Text("立即购票", style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(32),
                          // height: 40/40
                          )
                        ),
                      )
                    )

                  ],
                ),
              ),

              Positioned(
                top: ScreenUtil().setWidth(60),
                left: ScreenUtil().setWidth(27),
                child: Icon(Icons.arrow_back, color: Color(0xFF313131), size: ScreenUtil().setWidth(43)),
              ),

              Positioned(
                top: ScreenUtil().setWidth(60),
                right: ScreenUtil().setWidth(27),
                child: Icon(Icons.share, color: Color(0xFF313131), size: ScreenUtil().setWidth(43)),
              ),
              
            ],
          ),
        ),


      ),
    
    );

  }

  

}