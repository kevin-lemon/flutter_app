import 'package:flutter/material.dart';
import 'package:flutterapp/resources/values/app_colors.dart';
import 'package:flutterapp/ui/discover/discover_page.dart';
import 'package:flutterapp/ui/home/home_model.dart';
import 'package:flutterapp/ui/home/home_page.dart';
import 'package:flutterapp/ui/main_drawer/main_drawer.dart';
import 'package:flutterapp/ui/project/project_page.dart';
import 'package:flutterapp/ui/system/system_page.dart';


import 'UI/navigation/navigation_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  int _tabIndex = 0;
  var appBarTitles = ['首页', '体系', '导航', '项目','发现'];
  var _pageList;
  var tabImages;

  /*
   * 根据image路径获取图片
   */
  Icon getTabIcon(path, color) {
    return Icon(
      path,
      color: color,
      size: 24.0,
    );
  }

  Icon getTabIconIndex(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][0];
    } else {
      return tabImages[curIndex][1];
    }
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(appBarTitles[curIndex],
          style: TextStyle(fontSize: 14.0, color: AppColors.appTheme));
    } else {
      return Text(appBarTitles[curIndex],
          style: TextStyle(fontSize: 14.0, color: AppColors.appThemeUnSelect));
    }
  }

  initData() {
    tabImages = [
      [
        getTabIcon(Icons.home, AppColors.appTheme),
        getTabIcon(Icons.home, AppColors.appThemeUnSelect)
      ],
      [
        getTabIcon(Icons.account_tree, AppColors.appTheme),
        getTabIcon(Icons.account_tree, AppColors.appThemeUnSelect)
      ],
      [
        getTabIcon(Icons.outbond, AppColors.appTheme),
        getTabIcon(Icons.outbond, AppColors.appThemeUnSelect)
      ],
      [
        getTabIcon(Icons.now_widgets_sharp, AppColors.appTheme),
        getTabIcon(Icons.now_widgets_sharp, AppColors.appThemeUnSelect)
      ],
      [
        getTabIcon(Icons.album, AppColors.appTheme),
        getTabIcon(Icons.album, AppColors.appThemeUnSelect)
      ]
    ];

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitles[_tabIndex]),
          automaticallyImplyLeading: false),
      body: IndexedStack(
        index: _tabIndex,
        children: [HomePage(), SystemPage(),NavigationPage(),ProjectPage(),DiscoverPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: getTabIconIndex(0), title: getTabTitle(0)),
          BottomNavigationBarItem(
              icon: getTabIconIndex(1), title: getTabTitle(1)),
          BottomNavigationBarItem(
              icon: getTabIconIndex(2), title: getTabTitle(2)),
          BottomNavigationBarItem(
              icon: getTabIconIndex(3), title: getTabTitle(3)),
          BottomNavigationBarItem(
              icon: getTabIconIndex(4), title: getTabTitle(4)),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        iconSize: 24.0,
        type: BottomNavigationBarType.fixed,
      ),
        drawer:MainDrawer()
    );
  }

}
