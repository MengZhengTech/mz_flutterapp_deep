import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

// 大图滚动
class ImageScroll extends StatefulWidget {
  ImageScroll({Key key}) : super(key: key);
  // final List images;  // 图片地址和页面地址

  @override
  _ImageScrollState createState() => new _ImageScrollState();
}

class _ImageScrollState extends State<ImageScroll> {
  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return new ConstrainedBox(
      constraints:

      new BoxConstraints(
          minWidth: double.infinity,
          minHeight: ScreenUtil().setWidth(300),
          maxHeight: ScreenUtil().setWidth(300),
      ),

      child:

      Stack(
        alignment: FractionalOffset.bottomCenter,
        children: <Widget>[
          PageView.builder(
            onPageChanged: (index) => pageIndexNotifier.value = index,
            itemCount: length,
            itemBuilder: (context, index) {
              return

                Image(
                    image: AssetImage("assets/images/demo/demo${index+1}.jpg"),
                    fit: BoxFit.cover
                );

            },
          ),
          _buildExample2()
        ],
      ),

    );

  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.accents.elementAt((index + 3) * 3),
        ),
      ),
    );
  }

  PageViewIndicator _buildExample2() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black38,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  PageViewIndicator _buildExample3() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Icon(Icons.favorite, color: Colors.black87),
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Icon(Icons.star, color: Colors.white),
      ),
    );
  }

}
