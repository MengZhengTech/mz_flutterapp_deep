import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//  活动列表
class CardList extends StatefulWidget {
  CardList({Key key}) : super(key: key);
  // final List images;  // 图片地址和页面地址

  @override
  _CardListState createState() => new _CardListState();
}

class _CardListState extends State<CardList> {


  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];


  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
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
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {

    Future.delayed(Duration(seconds: 2)).then((e) {

      String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

      _words.insertAll(_words.length - 1,
        str.split("")
      );
      setState(() {
        //重新构建列表
      });
    });

  }



}
