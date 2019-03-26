/**
 * created by Huai 2019/3/22 0022
 * 登录页
 */
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email, password, phone;
  bool _isObscure = true;
  Color _eyeColor;
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
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

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
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 43.0),
                  children: <Widget>[
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                    buildLogo(context),
                    // buildEmailTextField(),
                    // SizedBox(height: 30.0),
                    buildPhoneText(context),
                    buildPhoneNumberField(),
                    SizedBox(height: ScreenUtil().setWidth(63)),
                    buildLoginButton(context),
                    SizedBox(height: ScreenUtil().setWidth(150)),
                    buildOtherLoginText(),
                    buildOtherMethod(context),
                    buildRegisterText(context),
                  ],
                ))));
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

  // 手机号
  Padding buildPhoneText(BuildContext context) {
    return Padding(
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
                  fontSize: ScreenUtil().setSp(34), color: Colors.white),
            )
          ],
        ));
  }

  // 登录按钮
  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: ScreenUtil().setWidth(110),
        width: ScreenUtil().setWidth(580),
        child: GradientButton(
          child: Text('手机号登录'),
          callback: () => print(''),
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
          textStyle:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),
        ),
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

  // 忘记密码
  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  // 手机号
  TextFormField buildPhoneNumberField() {
    return TextFormField(
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
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
      ),
      validator: (String value) {
        var phoneReg = RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$');
        if (!phoneReg.hasMatch(value)) {
          return '请输入正确的手机号码';
        }
      },
      onSaved: (String value) => phone = value,
      style: TextStyle(color: Colors.white),
    );
  }

  // 密码框
  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
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
    );
  }

  // 登录框
  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emall Address',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }
      },
      onSaved: (String value) => email = value,
    );
  }

  // logo
  Padding buildLogo(BuildContext context) {
    var paddingVal = ScreenUtil().setWidth(115);
    print(paddingVal);
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingVal, ScreenUtil().setWidth(140),
          paddingVal, ScreenUtil().setWidth(150)), // left top right bottom
      child: Image.asset(
        'assets/images/logo@2x.png',
      ),
    );
  }
}

// 跳转注册模块
Align buildRegisterText(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: true,// this.check,
            activeColor: Colors.greenAccent, // #27948B
            onChanged: (bool val) {
              // val 是布尔值
              print('复选框值:${val}');
            },
          ),
          Text('我已经阅读并同意'),
          GestureDetector(
            child: Text(
              'DEEP用户协议',
              style: TextStyle(color: Colors.green), // 78CEFF
            ),
            onTap: () {
              //TODO 跳转到注册页面
              print('DEEP用户协议');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
