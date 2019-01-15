import 'package:flutter/material.dart'; //导入包
import 'routes/login_page.dart';
import 'routes/register_page.dart';
import 'routes/setting_page.dart';
import 'routes/file_list_page.dart';
import 'routes/welcome.dart';
import 'routes/home_page.dart';

// 应用程序入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 设置路由
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    SettingPagePage.tag: (context) => SettingPagePage(),
    FileListPagePage.tag: (context) => FileListPagePage(),
    WelcomePage.tag: (context) => WelcomePage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easy nas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Nunito'),
      home: WelcomePage(),
      routes: routes,
    );
  }
}
