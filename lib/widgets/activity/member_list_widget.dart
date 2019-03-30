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
                              data[index]['name'],
                              style: TextStyle(
                                color: Color(0xFF1B1B1B),
                                fontSize: ScreenUtil().setSp(26),
                                height: 1
                              ),
                              softWrap: true
                            ),

                            Container(
                              width:ScreenUtil().setWidth(125),
                              height: ScreenUtil().setWidth(28),
                              margin: EdgeInsets.only(left: 0, right: 0, top: ScreenUtil().setWidth(4), bottom: ScreenUtil().setWidth(4)),
                              child:

                              DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors:[Color(0xFF57CEA8), Color(0xFF68B7D9)]), //背景渐变
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: 
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[  
                                    Padding(
                                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                                      child: Icon((data[index]['sex'] == 'female' ? Icons.face : Icons.mood), color: Color(0xFFffffff), size: ScreenUtil().setWidth(28)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                                      child: 
                                      Text(
                                        data[index]['age'],
                                        style: TextStyle(
                                          color: Color(0xFFffffff),
                                          fontSize: ScreenUtil().setSp(24),
                                          height: 26/24
                                        ),
                                        softWrap: true
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                                      child: 
                                      Text(
                                        data[index]['constellation'],
                                        style: TextStyle(
                                          color: Color(0xFFffffff),
                                          fontSize: ScreenUtil().setSp(24),
                                          height: 22/24
                                        ),
                                        softWrap: true
                                      ),
                                    ),
                                  ],
                                ),

                              ),

                            ),

                            Container(
                              width:ScreenUtil().setWidth(320),
                              height: ScreenUtil().setWidth(30),
                              child: Text(
                                data[index]['message'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: ScreenUtil().setSp(22),
                                  height: 1
                                ),
                                softWrap: true
                              ),
                            ),
                            

                          ],
                        ),      

                        Positioned(
                          bottom: ScreenUtil().setWidth(35),
                          right: ScreenUtil().setWidth(6),
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
          {'name': '路人甲', 'sex': 'male', 'age': '23', 'constellation': '白羊', 
          'message': '人生若只如初见，当时却知道是宣传'},
          {'name': '嘻嘻的温暖', 'sex': 'female', 'age': '23', 'constellation': '白羊', 
          'message': '万事接续，万物捷运'},
          {'name': '孤独的设计是', 'sex': 'male', 'age': '23', 'constellation': '白羊', 
          'message': '海上月是天使月，延期人是新鲜事'},
          {'name': '任性是吗', 'sex': 'male', 'age': '23', 'constellation': '白羊', 
          'message': '商河公司，魏军一下'},
        ];
        data.addAll(dataRetrieve); 
      });

    });

  }

}
