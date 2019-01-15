import 'package:flutter/material.dart';
import 'package:easy_nas_app/components/icon_tab.dart';
import 'package:easy_nas_app/components/first.dart';


// tab大小
const double _kTabTextSize = 11.0;

// tab索引值
const int INDEX_FIRST = 0;
const int INDEX_SECOND = 1;
const int INDEX_THIRD = 2;
const int INDEX_FOURTH = 3;

// color
Color _kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);

// 主页
class HomePage extends StatefulWidget {
  static String tag = "Home-page";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  //　当前tab索引
  int currentIndex = 0;

  //　tab控制器
  TabController tabController;

  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    tabController =
    new TabController(initialIndex: currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        currentIndex = this.tabController.index;
      });
    };

    tabController.addListener(onChanged);
  }

  @override
  void dispose() {
    tabController.removeListener(onChanged);
    tabController.dispose();
    super.dispose();
  }

  // 文件列表　下载　上传　个人中心　需要思考如何布局

  @override
  Widget build(BuildContext context) {

    final bottomtap = new Material(
      color: Colors.white,
      child: new TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: new TextStyle(fontSize: _kTabTextSize),
        tabs: <IconTab>[
          new IconTab(
              icon: currentIndex == INDEX_FIRST
                  ? "images/home/ic_main_tab_company_pre.png"
                  : "images/home/ic_main_tab_company_nor.png",
              text: "文件列表",
              color: currentIndex == INDEX_FIRST
                  ? _kPrimaryColor
                  : Colors.grey[900]),
          new IconTab(
              icon: currentIndex == INDEX_SECOND
                  ? "images/home/ic_main_tab_contacts_pre.png"
                  : "images/home/ic_main_tab_contacts_nor.png",
              text: "下载详情",
              color: currentIndex == INDEX_SECOND
                  ? _kPrimaryColor
                  : Colors.grey[900]),
          new IconTab(
              icon: currentIndex == INDEX_THIRD
                  ? "images/home/ic_main_tab_find_pre.png"
                  : "images/home/ic_main_tab_find_nor.png",
              text: "上传文件",
              color: currentIndex == INDEX_THIRD
                  ? _kPrimaryColor
                  : Colors.grey[900]),
          new IconTab(
              icon: currentIndex == INDEX_FOURTH
                  ? "images/home/ic_main_tab_my_pre.png"
                  : "images/home/ic_main_tab_my_nor.png",
              text: "个人中心",
              color: (currentIndex == INDEX_FOURTH)
                  ? _kPrimaryColor
                  : Colors.grey[900]),
        ],
      ),
    );

    return Scaffold(
        body: new TabBarView(
          children: <Widget>[new FirstItem("文件列表"), new FirstItem("下载详情"), new FirstItem("上传文件"), new FirstItem("个人中心")],
          controller: tabController,
        ),
        bottomNavigationBar: bottomtap);
  }
}
