import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';
import 'package:fluro/fluro.dart';

//  活动列表
class MemberListWidget extends StatefulWidget {
  MemberListWidget({Key key}) : super(key: key);

  @override
  _MemberListWidgetState createState() => new _MemberListWidgetState();
}

class _MemberListWidgetState extends State<MemberListWidget> {

  List<Map> data = [];
  int total = 40;  // 限制列表数量

  @override
  void initState() {  
    super.initState();
    _retrieveData(); 
  }

  @override
  Widget build(BuildContext context) {   

    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) { 

        if (index >= data.length - 1) {  
          if (data.length <= total) {  
            _retrieveData();
            
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );

          } else {  

            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );

          }
        }
        
        return 
        GestureDetector(
          // onTap: () => Application.router.navigateTo(context, '/activity/detail', transition: TransitionType.inFromRight),
          child: 

          new Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(40),
              horizontal: ScreenUtil().setWidth(22),
            ),
            child: Row(
              children: <Widget>[

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                    borderRadius: BorderRadius.circular(53.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/demo/user${index % 3 + 1}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    width: ScreenUtil().setWidth(106),
                    height: ScreenUtil().setWidth(106),
                  ),
                ),
                
                Container(
                  width: ScreenUtil().setWidth(580),
                  height: ScreenUtil().setWidth(106),
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(22)),
                  child:  ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Stack(
                      alignment:Alignment.topLeft, 
                      children: <Widget>[

                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              data[index]['title'],
                              style: TextStyle(
                                color: Color(0xFF1B1B1B),
                                fontSize: ScreenUtil().setSp(30),
                                height: 40/30
                              ),
                              softWrap: true
                            ),

                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors:[Color(0xFF57CEA8), Color(0xFF68B7D9)]), //背景渐变
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: 
                              
                              Row(
                                children: <Widget>[  // Icons.mood
                                  Icon(Icons.face, color: Color(0xFFffffff), size: ScreenUtil().setWidth(28)),
                                  Text(
                                    data[index]['address'],
                                    style: TextStyle(
                                      color: Color(0xFF707070),
                                      fontSize: ScreenUtil().setSp(24),
                                      height: 30/24
                                    ),
                                    softWrap: true
                                  ),
                                ],
                              ),

                            ),

                            Text(
                              data[index]['title'],
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: ScreenUtil().setSp(24),
                                height: 30/24
                              ),
                              softWrap: true
                            ),

                          ],
                        ),      

                        Positioned(
                          bottom: 1.0,
                          left: 1.0,
                          child: Text(
                            data[index]['price'],
                            style: TextStyle(
                              color: Color(0xFF313131),
                              fontSize: ScreenUtil().setSp(28),
                              height: 30/28
                            ),
                            softWrap: true
                          ),
                        ),

                        Positioned(
                          bottom: 71.0,
                          right: 1.0,
                          child: Icon(Icons.control_point, color: Color(0xFFB5B5B5), size: ScreenUtil().setWidth(38)),
                        ),
                        
                      ],
                    ),
                  ),

                )

              ]
            ),
          ),

        );

        
      },
      separatorBuilder: (context, index) => Divider(height: 1.0),
    );
  }

  int getLen(str) {
    int len = 0;
    for(int i = 0, il = str.length; i < il; i++){
      if(str.codeUnitAt(i) < 100) len++;
      else len+=2;
    }
    return len;
  }

  void _retrieveData() { 
    Future.delayed(Duration(seconds: 2)).then((e) {  

      setState(() {
        List<Map> dataRetrieve = [
          {'title': '【演唱会】张国荣全息投影演唱会，跨年演唱会第一场', 'address': '福建省厦门市同安区', 
          'price': '￥280', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵10元']},
          {'title': '【亲子游】厦门乡村一日游，赠《芙蓉国粹》大型变脸秀', 'address': '福建省厦门市海沧区', 
          'price': '￥160 - ￥180', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵6元']},
          {'title': '【演唱会】张国荣全息投影演唱会，跨年演唱会第一场', 'address': '福建省厦门市同安区', 
          'price': '￥280', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵10元']},
          {'title': '【亲子游】厦门乡村一日游，赠《芙蓉国粹》大型变脸秀', 'address': '福建省厦门市海沧区', 
          'price': '￥160 - ￥180', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵6元']},
          {'title': '【演唱会】张国荣全息投影演唱会，跨年演唱会第一场', 'address': '福建省厦门市同安区', 
          'price': '￥280', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵100元']},
          {'title': '【亲子游】厦门乡村一日游，赠《芙蓉国粹》大型变脸秀', 'address': '福建省厦门市海沧区', 
          'price': '￥160 - ￥180', 'vote': '95.5% 满意', 'label': ['随时退', '能量抵666元']},
        ];
        data.addAll(dataRetrieve); 
      });

    });

  }

}
