import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

import 'dart:ui' as ui;

class WelcomePage extends StatefulWidget {
  static String tag = 'welcome-page';

  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {

  //Flutter中的Animation对象是一个在一段时间内依次生成一个区间之间值的类。Animation对象的输出可以是线性的、曲线的、一个步进函数或者任何其他可以设计的映射。 根据Animation对象的控制方式，动画可以反向运行，甚至可以在中间切换方向。
  Animation<double> animation;

  // AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    // 将动画过程定义为一个非线性曲线
    animation = new CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );
    // 添加Listener对象　
    animation.addListener(() => this.setState(() {}));
    // 启动动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 登录
    final login = new FlatButton(
      child: new Text(
        "Login",
        style: TextStyle(color: Colors.grey, fontSize: 20.0),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(LoginPage.tag);
      },
    );

    // 注册
    final register = Padding(
      padding: EdgeInsets.all(4.0),
      child: RaisedButton(
        // 圆角矩形
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: Colors.white, width: 2.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RegisterPage.tag);
        },
        padding: EdgeInsets.fromLTRB(148.0, 12.0, 148.0, 12.0),
        color: Colors.transparent,
        child: Text('Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
      ),
    );

    return Container(
      child: new Scaffold(
        body: new Stack(
          // 按大
          fit: StackFit.expand,
          children: <Widget>[
            new Opacity(
                opacity: 1,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('images/home.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            // 高斯模糊
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 5.0),
              child: new Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Center(
                  // child: new FlutterLogo(
                  //   size: _iconAnimation.value * 140.0,
                  // ),
                ),
                new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        register,
                        SizedBox(height: 10.0),
                        login,
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
