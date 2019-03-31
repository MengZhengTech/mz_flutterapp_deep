import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';
import 'package:fluro/fluro.dart';

//  活动列表
class InviteListWidget extends StatefulWidget {
  InviteListWidget({Key key}) : super(key: key);

  @override
  _InviteListWidgetState createState() => new _InviteListWidgetState();
}

class _InviteListWidgetState extends State<InviteListWidget> {

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
          onTap: () => openDialog(context),
          child: 

          new Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(10),
              horizontal: ScreenUtil().setWidth(25),
            ),
            child: Row(
              children: <Widget>[

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                    borderRadius: BorderRadius.circular(36.0),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/demo/user${index % 3 + 1}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    width: ScreenUtil().setWidth(72),
                    height: ScreenUtil().setWidth(72),
                  ),
                ),
                
                Container(
                  width: ScreenUtil().setWidth(580),
                  height: ScreenUtil().setWidth(72),
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(22)),
                  child:  ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Stack(
                      alignment:Alignment.topLeft, 
                      children: <Widget>[

                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              data[index]['name'],
                              style: TextStyle(
                                color: Color(0xFF1B1B1B),
                                fontSize: ScreenUtil().setSp(30),
                                height: 1
                              ),
                              softWrap: true
                            ),
                            
                          ],
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

  void openDialog(pagectx) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
          return new Dialog(
              backgroundColor: Color(0xFFEEEEEE),
              insetAnimationDuration: const Duration(milliseconds: 100), 
              insetAnimationCurve: Curves.decelerate,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
              child: SizedBox(
                width: ScreenUtil().setWidth(510),
                height: ScreenUtil().setWidth(536),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      '发给', 
                      style:TextStyle(
                        color:Color(0xff000000),
                        fontSize: ScreenUtil().setSp(30),
                        height: 60/30,
                        fontWeight: FontWeight.bold,
                      )
                    ),

                    Container(
                      height: ScreenUtil().setWidth(114),
                      padding:EdgeInsets.only(left:ScreenUtil().setWidth(29), bottom:ScreenUtil().setWidth(36), top: 0, right: ScreenUtil().setWidth(29)),
                      child: Row(
                        children: <Widget>[

                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                              borderRadius: BorderRadius.circular(39),
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/demo/user1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(78),
                              height: ScreenUtil().setWidth(78),
                            ),
                          ),
                          
                          Container(
                            width: ScreenUtil().setWidth(390),
                            height: ScreenUtil().setWidth(78),
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                            child:  ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Stack(
                                alignment:Alignment.topLeft, 
                                children: <Widget>[

                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text(
                                        '不愿意透露姓名的学者',
                                        style: TextStyle(
                                          color: Color(0xFF1B1B1B),
                                          fontSize: ScreenUtil().setSp(28),
                                          height: 1
                                        ),
                                        softWrap: true
                                      ),
                                      
                                    ],
                                  ),      
                                  
                                ],
                              ),
                            ),

                          )

                        ]
                      ),
                    ),

                    Container(
                      height: ScreenUtil().setWidth(160),
                      padding:EdgeInsets.only(left:ScreenUtil().setWidth(29), bottom:ScreenUtil().setWidth(20), top: 0, right: ScreenUtil().setWidth(29)),
                      child: Row(
                        children: <Widget>[

                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                              borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/demo/user2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(140),
                              height: ScreenUtil().setWidth(140),
                            ),
                          ),

                          DecoratedBox(
                            decoration: BoxDecoration(
                              color:Color(0xffffffff)
                            ),
                            child: 
                            
                            Container(
                              width: ScreenUtil().setWidth(344),
                              height: ScreenUtil().setWidth(140),
                              padding: EdgeInsets.only(left: ScreenUtil().setWidth(15), right: ScreenUtil().setWidth(15)),
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

                                        Padding(
                                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                                          child: Text(
                                            '张国荣全息投影演唱会',
                                            style: TextStyle(
                                              color: Color(0xFF313131),
                                              fontSize: ScreenUtil().setSp(26),
                                              height: 1
                                            ),
                                            softWrap: true
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(18)),
                                          child: Text(
                                            '福建省厦门市同安区',
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
                                    
                                  ],
                                ),
                              ),

                            )
                            
                          ),
                          
                          
                        ]
                      ),
                    ),

                    Container(
                      height: ScreenUtil().setWidth(90),
                      padding:EdgeInsets.only(left:ScreenUtil().setWidth(29), bottom:ScreenUtil().setWidth(20), top: 0, right: ScreenUtil().setWidth(29)),
                      child: 
                      
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color:Color(0xffffffff),
                          borderRadius: BorderRadius.circular(.0),
                        ),
                        child: 
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: false,
                              fillColor: Color(0xFFEBEBEB),
                              border: InputBorder.none,
                              hintText: "给朋友留言",
                              hintStyle: TextStyle(color: Color(0xFFB5B5B5), fontSize: ScreenUtil().setSp(28), height: 1),
                              contentPadding:EdgeInsets.only(left:ScreenUtil().setWidth(10), right:ScreenUtil().setWidth(10), top:ScreenUtil().setWidth(14), bottom:ScreenUtil().setWidth(2)),
                          ),
                          style:TextStyle(
                            color: Color(0xFF1B1B1B), fontSize: ScreenUtil().setSp(32), height: 1
                          ),
                          scrollPadding: const EdgeInsets.all(.0), 
                        )
                      ),

                    ),

                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: ScreenUtil().setWidth(2), color: Color(0xFFD4D3D1)),
                        ),
                      ),
                      child:

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xFFDCDCDC)),
                              ),
                            ),
                            child:
                            SizedBox(
                              width: ScreenUtil().setWidth(270),
                              height: ScreenUtil().setWidth(77),
                              child: 
                              FlatButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                padding:EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30), vertical: ScreenUtil().setWidth(20)),
                                child: Text("取消", style: TextStyle(
                                  color: Color(0xFF434343),
                                  fontSize: ScreenUtil().setSp(30)
                                )),
                                onPressed: () => Navigator.of(pagectx).pop(),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: ScreenUtil().setWidth(270),
                            height: ScreenUtil().setWidth(77),
                            child: 
                            FlatButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              padding:EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30), vertical: ScreenUtil().setWidth(20)),
                              child: Text("发送", style: TextStyle(
                                color: Color(0xFF57CDA9),
                                fontSize: ScreenUtil().setSp(30)
                              )),
                              onPressed: () => {},
                            ),
                          ),

                        ],
                      ),
                      
                    ),


                  ],
                ),
              ),

              
              // title: new Text('标题'),
              // content: new SingleChildScrollView(
              //     child: new ListBody(
              //         children: <Widget>[
              //             new Text('内容 1'),
              //             new Text('内容 2'),
              //         ],
              //     ),
              // ),
              // actions: <Widget>[
              //     new FlatButton(
              //       child: new Text('确定'),
              //       onPressed: () {
              //           Navigator.of(context).pop();
              //       },
              //     ),
              //     new FlatButton(
              //       child: new Text('取消'),
              //       onPressed: () {
              //           Navigator.of(context).pop();
              //       },
              //     ),
              // ],

          );
      },
    ).then((val) {
        print(val);
    });
  }

}
