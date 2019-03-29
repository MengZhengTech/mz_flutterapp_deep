import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 地址、活动、搜索活动
class HeaderBarWidget extends StatefulWidget {
  HeaderBarWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HeaderBarWidgetState createState() => new _HeaderBarWidgetState();
}

class _HeaderBarWidgetState extends State<HeaderBarWidget> {
  String _place = '厦门';

  void _setPlace(String name) {
    setState(() {
      _place = name;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Container(
      height: ScreenUtil().setWidth(149), 
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(32), 
        top: ScreenUtil().setWidth(71), 
        right: ScreenUtil().setWidth(32), 
        bottom: ScreenUtil().setWidth(32)
      ),
    
      child: 
      ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: 

        Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[

            Container(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFF313131),
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(32)
                )
              ),
            ),

            Positioned(
              left: ScreenUtil().setWidth(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(_place, style:TextStyle(
                    color: Color(0xFF313131),
                    fontSize: ScreenUtil().setSp(28)
                  )),
                  new Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),

            Positioned(
              right: ScreenUtil().setWidth(32),
              child: new Icon(Icons.search),
            )

          ],
        ),
      
      ),
      
    );

  }
}
