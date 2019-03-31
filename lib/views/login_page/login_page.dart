/**
 * created by Huai 2019/3/22 0022
 * 登录页
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mz_flutterapp_deep/data/net/dio_util.dart';
import 'package:mz_flutterapp_deep/data/apis/apis.dart';

import 'package:mz_flutterapp_deep/widgets/login/verification_code.dart';

import 'package:mz_flutterapp_deep/routers/routers.dart';
import 'package:mz_flutterapp_deep/routers/application.dart';

import 'package:mz_flutterapp_deep/data/net/sqflite.dart';
import 'dart:convert';
import 'package:mz_flutterapp_deep/data/config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password, _phone, _verCode, _verifyStr = "获取验证码";

  // 不同步骤表示不同的状态 1： 输入手机号  2： 输入验证码  3： 输入密码
  int _loginStep = 1;
  bool _isObscure = true;
  Color _eyeColor;

  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;

  /// 是否已经发送 默认为 false
  bool _isSend = false;

  List _loginMethod = [
    {
      "title": "qqchat",
      "icon": GroovinMaterialIcons.qqchat,
    },
    {
      "title": "wechat",
      "icon": GroovinMaterialIcons.wechat,
    },
    {
      "title": "twitter",
      "icon": GroovinMaterialIcons.twitter,
    },
  ];

  @override
  void initState() {
    super.initState();
    _seconds = 60; // 默认60s
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          // 背景图片
          image: new AssetImage('assets/images/login_ground_glass.jpg'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 43.0),
                  children: <Widget>[
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                    buildLogo(context),
                    (_loginStep.toString() == "1")
                        ? buildPhoneComponent(context)
                        : (_loginStep.toString() == "2")
                            ? buildVerificationCode()
                            : buildPassWordComponent(context),
//                    Offstage(
//                      offstage: _step==1?false:true,
//                      child: buildPhoneComponent(context),  // 输入手机模块
//                    ),
//                    Offstage(
//                      offstage: _step==2?false:true,
//                      child: buildVerificationCode(),// 验证码 模块
//                    ),
//                    Offstage(
//                      offstage: _step==3?false:true,
//                      child: buildPassWordComponent(context), // 密码模块
//                    ),

                    SizedBox(height: ScreenUtil().setWidth(150)),
                    //buildOtherLoginText(),
                    SizedBox(height: 30.0),
                    // buildOtherMethod(context),
                    buildRegisterText(context),
                  ],
                ))));
  }

  // logo
  Padding buildLogo(BuildContext context) {
    var paddingVal = ScreenUtil().setWidth(115);
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingVal, ScreenUtil().setWidth(140),
          paddingVal, ScreenUtil().setWidth(150)), // left top right bottom
      child: Image.asset(
        'assets/images/logo@2x.png',
      ),
    );
  }

  // 手机号输入模块
  Center buildPhoneComponent(BuildContext context) {
    return new Center(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(14)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        GroovinMaterialIcons.cellphone_android,
                        color: Colors.white,
                        size: ScreenUtil().setSp(36),
                      ),
                      Text(
                        ' 手机号码',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(34),
                            color: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "请输入手机号",
              hintStyle: TextStyle(color: Colors.white70),
              prefixText: "+86  ",
              prefixStyle: TextStyle(
                color: Colors.white,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
            ),
            validator: (String value) {
              var phoneReg = RegExp(
                  '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$');
              if (!phoneReg.hasMatch(value)) {
                return '请输入正确的手机号码！';
              }
            },
            onSaved: (String value) => _phone = value,
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: new Container(
                  padding: new EdgeInsets.only(top: ScreenUtil().setWidth(60)),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: ScreenUtil().setWidth(110),
                    width: ScreenUtil().setWidth(580),
                    child: GradientButton(
                      child: Text('手机号登录'),
                      callback: () {
                        if (_formKey.currentState.validate()) {
                          ///只有输入的内容符合要求通过才会到达此处
                          _formKey.currentState.save();
                          //TODO 执行登录方法
                          postLoginData({
                            "params": {"phone": _phone}
                          });
                        }
                      },
                      increaseHeightBy: ScreenUtil().setWidth(110),
                      increaseWidthBy: ScreenUtil().setWidth(580),
                      shapeRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: const <Color>[
                          Color(0xff57CEA8),
                          Color(0xff68B7D9),
                        ],
                      ),
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(34)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // 验证码模块
  Center buildVerificationCode() {
    return new Center(
      child: Column(
        children: <Widget>[
          Row(
            // 标题
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      GroovinMaterialIcons.cellphone_android,
                      color: Colors.white,
                      size: ScreenUtil().setSp(36),
                    ),
                    Text(
                      ' 验证码',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.only(right: 2.0),
//                child: Align(
//                  alignment: Alignment.centerRight,
//                  child: FlatButton(
//                    child: Text(
//                      '密码输入',
//                      style: TextStyle(
//                          fontSize: ScreenUtil().setSp(28),
//                          color: Color(0xff50C2C9)),
//                    ),
//                    onPressed: () {
//                      _loginStep = 3;
//                      setState(() {});
//                    },
//                  ),
//                ),
//              )
            ],
          ),
          Row(
            // 输入框
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              VerificationCodeInput(
                keyboardType: TextInputType.number,
                length: 4,
                onCompleted: (String value) {
                  _verCode = value;
                  print(value);
                  postLogin(value);
                },
              )
            ],
          ),
          Row(
            // 按钮
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(55)),
                child: SizedBox(
                  height: ScreenUtil().setWidth(110),
                  width: ScreenUtil().setWidth(580),
                  child: GradientButton(
                    child: _isSend
                        ? InkWell(
                            child: Text(_verifyStr),
                          )
                        : InkWell(
                            child: Text("获取验证码"),
                          ),
                    callback: () {
                      if (_timer.toString() != "null") {
                        return false;
                      }
                      _startTimer();
                      _verifyStr = '已发送$_seconds' + 's';
                      setState(() {});
                    },
                    increaseHeightBy: ScreenUtil().setWidth(77),
                    increaseWidthBy: ScreenUtil().setWidth(250),
                    shapeRadius: BorderRadius.circular(50.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const <Color>[
                        Color(0xff51B1A7),
                        Color(0xff1FA093),
                      ],
                    ),
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // 密码模块
  Center buildPassWordComponent(BuildContext context) {
    return new Center(
      child: Column(
        children: <Widget>[
          Row(
            // 标题
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      GroovinMaterialIcons.lock_outline,
                      color: Colors.white,
                      size: ScreenUtil().setSp(36),
                    ),
                    Text(
                      ' 密码',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      '验证码登录',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color(0xff50C2C9)),
                    ),
                    onPressed: () {
                      _loginStep = 2;
                      setState(() {});
                    },
                  ),
                ),
              )
            ],
          ),
          TextFormField(
            onSaved: (String value) => _password = value,
            obscureText: _isObscure,
            validator: (String value) {
              if (value.isEmpty) {
                return '密码为空，请输入密码！';
              }
            },
            decoration: InputDecoration(
                hintText: '请输入密码',
                hintStyle: TextStyle(color: Colors.white70),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _eyeColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                        _eyeColor = _isObscure
                            ? Colors.grey
                            : Theme.of(context).iconTheme.color;
                      });
                    })),
          ),
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  '忘记密码？',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      color: Color(0xFF50C2C9)),
                ),
                onPressed: () {
                  // 跳转到忘记密码页面
                },
              ),
            ),
          ),
          Row(
            // 按钮
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(25)),
                child: SizedBox(
                  height: ScreenUtil().setWidth(110),
                  width: ScreenUtil().setWidth(580),
                  child: GradientButton(
                    child: Text('登录'),
                    callback: () {
                      postLogin(_password);
                    },
                    increaseHeightBy: ScreenUtil().setWidth(77),
                    increaseWidthBy: ScreenUtil().setWidth(250),
                    shapeRadius: BorderRadius.circular(50.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const <Color>[
                        Color(0xff51B1A7),
                        Color(0xff1FA093),
                      ],
                    ),
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // 快速登录按钮
  Align buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '快速登录',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ));
  }

  // 第三方登录模块
  ButtonBar buildOtherMethod(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(
                builder: (context) {
                  return IconButton(
                      icon: Icon(item['icon'],
                          color: Theme.of(context).iconTheme.color),
                      onPressed: () {
                        //TODO : 第三方登录方法
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("${item['title']}登录"),
                          action: new SnackBarAction(
                            label: "取消",
                            onPressed: () {},
                          ),
                        ));
                      });
                },
              ))
          .toList(),
    );
  }

  // 协议声明模块
  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: true, // this.check,
              activeColor: Colors.greenAccent, // #27948B
              onChanged: (bool val) {
                // val 是布尔值
                print('复选框值:${val}');
              },
            ),
            Text('我已经阅读并同意',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28))),
            GestureDetector(
              child: Text(
                'DEEP用户协议',
                style: TextStyle(
                    color: Color(0xFF78CEFF),
                    decoration: TextDecoration.underline,
                    fontSize: ScreenUtil().setSp(28)), // 78CEFF
              ),
              onTap: () {
                //TODO 跳转到注册页面
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 执行登录操作
  void postLoginData([Map<String, dynamic> params]) async {
    try {
      var response = await NetUtils.post(
          "${NetUtils.host}${DeepApi.USER_PHONE}",
          {"loginName": params["params"]["phone"], "type": 1});
      var status = response["status"];
      print(response.toString());
      if (status == 1) {
        _loginStep = 2;
      } else {
        if(response["data"].toString().indexOf("loginPwd")!=-1 && response["data"]["loginPwd"].toString() !="" ){
          //var loginPwd = response["data"]["loginPwd"].toString();
          _loginStep = 3;
        }else{
          _loginStep = 2;
        }
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  // 获取验证码
  void getVerCode([Map<String, dynamic> params]) async {
    try {
      print(params["params"]["phone"].toString());
      var response = await NetUtils.post("${NetUtils.host}${DeepApi.GET_SMS}",
          {"loginName": params["params"]["phone"], "type": 1});
      var status = response["status"];

      print(response.toString());
    } catch (e) {
      print(e);
    }
  }
  //登录
 void postLogin(String postdata) async{
   try {
     DateTime now = DateTime.now();
     Map<String, dynamic> datas ;
     if(_loginStep == 2 )
     {
         datas = {"loginName": _phone, "type": 1,"verificationCode":postdata};
     }else{
         datas = {"loginName": _phone, "type": 1,"loginPwd":postdata};
     }
     print(datas.toString());
     var response = await NetUtils.post("${NetUtils.host}${DeepApi.CHECK_PHONE}", datas);
     print(response.toString());
     var status = response["status"];
     if(status == 0)
       {
           var dataStr  = response["data"];
           var data = json.decode(dataStr);
           print(dataStr);
           DateTime time = now.add(new Duration(days: 7));
           String year = time.year.toString();
           String month = time.month>9?time.month.toString():"0" + time.month.toString();
           String day = time.day>9?time.day.toString():"0"+time.day.toString();
           String dateTime = year + "-" + month + "-" + day;
           String loginPwd = dataStr.indexOf("loginPwd")!=-1?data["loginPwd"]:"";
           String name = dataStr.indexOf("name")!=-1?data["name"]:"";
           String signature = dataStr.indexOf("signature")!=-1?data["signature"]:"";
           String chatSign = dataStr.indexOf("chatSign")!=-1?data["chatSign"]:"";
           print(data["guid"].toString());
           User userData = new User(0, data["guid"].toString(), data["loginName"].toString(), loginPwd, data["type"].toString(), chatSign , name, signature, dateTime);
           UserSqlite userSqlite = new UserSqlite();
           await userSqlite.openSqlite();
           print(userData.guid);
           User user = await userSqlite.getUser(userData.guid);
           if(user == null)
           {
              await userSqlite.insert(userData);
           }else{
              await userSqlite.update(userData);
           }
           Config.isLogin = true;
           await userSqlite.close();
           await Application.router.navigateTo(context, "${Routes.root}");
       }else{

     }
   } catch (e) {
     print(e);
   }
 }
  // 验证码 倒计时
  void _startTimer() {
    print("开始计时");
    getVerCode({
      "params": {"phone": _phone}
    });
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (!_isSend) {
        _isSend = !_isSend;
      }
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = 60;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds' + 's';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
