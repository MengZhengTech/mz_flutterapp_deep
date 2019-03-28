import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//  活动列表
class CardListWidget extends StatefulWidget {
  CardListWidget({Key key}) : super(key: key);

  @override
  _CardListWidgetState createState() => new _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {

  List<Map> data = [];
  int total = 40;  // 限制列表数量

  @override
  void initState() {  
    super.initState();
    _retrieveData(); 
  }

  @override
  Widget build(BuildContext context) {   

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); 

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

        new Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(37),
            horizontal: ScreenUtil().setWidth(29),
          ),
          child: Row(
            children: <Widget>[

              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[Colors.black54, Colors.black26]), //背景渐变
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/demo/user${index % 3 + 1}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  width: ScreenUtil().setWidth(210),
                  height: ScreenUtil().setWidth(250),
                ),
              ),
              
              Container(
                width: ScreenUtil().setWidth(462),
                height: ScreenUtil().setWidth(250),
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(36)),
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
                              fontSize: ScreenUtil().setWidth(28),
                              height: 30/28
                            ),
                            softWrap: true
                          ),

                          Row(
                            children: <Widget>[
                              Icon(Icons.room, color: Color(0xFF707070), size: ScreenUtil().setWidth(28)),
                              Text(
                                data[index]['address'],
                                style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: ScreenUtil().setWidth(24),
                                  height: 30/24
                                ),
                                softWrap: true
                              ),
                            ],
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
                            fontSize: ScreenUtil().setWidth(28),
                            height: 30/28
                          ),
                          softWrap: true
                        ),
                      ),

                      Positioned(
                        bottom: 1.0,
                        right: 1.0,
                        child: Text(
                          data[index]['vote'],
                          style: TextStyle(
                            color: Color(0xFF959595),
                            fontSize: ScreenUtil().setWidth(24),
                            height: 30/24
                          ),
                          softWrap: true
                        ),
                      ),

                      Positioned(
                        bottom: 26.0,
                        left: 4.0,
                        child: Row(
                          children: <Widget>[

                            Container(
                              width: ScreenUtil().setWidth(getLen(data[index]['label'][0]) * 10 + 20),  // 根据文字数量设置长度，3*20+20
                              height: ScreenUtil().setWidth(34),
                              margin: EdgeInsets.only(right: ScreenUtil().setWidth(14)),
                              child: OutlineButton(
                                child: Text(data[index]['label'][0], style:TextStyle(height: 1, fontSize: ScreenUtil().setWidth(18))),
                                textColor: Color(0xFF57CEA8),
                                borderSide: BorderSide(color: Color(0xFF57CEA8), width: 1.0),
                                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(1), horizontal: ScreenUtil().setWidth(1)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                onPressed: () => {},
                              ),
                            ),
                            
                            Container(
                              width: ScreenUtil().setWidth(getLen(data[index]['label'][1]) * 10 + 20),
                              height: ScreenUtil().setWidth(34),
                              margin:EdgeInsets.only(right: ScreenUtil().setWidth(1)),
                              child: OutlineButton(
                                child: Text(data[index]['label'][1], style:TextStyle(height: 1, fontSize: ScreenUtil().setWidth(18))),
                                textColor: Color(0xFF57CEA8),
                                borderSide: BorderSide(color: Color(0xFF57CEA8), width: 1.0),
                                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(1), horizontal: ScreenUtil().setWidth(1)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                onPressed: () => {},
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              )

            ]
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
