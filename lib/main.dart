import 'package:flutter/material.dart';
import 'common/assetImages.dart';
import 'common/bottom_button.dart';
import 'pages/home/index.dart';
import 'pages/message/index.dart';
import 'pages/follow-with-interest/index.dart';
import 'pages/user/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPage();
}

class _MyAppPage extends State<MyAppPage> {
  List<BottomItem> tabList = [
    const BottomItem(
      icon: AssetImages.homePagePng,
      activeIcon: AssetImages.homePagePng,
      label: "首页",
      width: 28,
    ),
    const BottomItem(
      icon: AssetImages.videoPng,
      activeIcon: AssetImages.videoPng,
      label: "视频",
      width: 28,
    ),
    const BottomItem(
      icon: AssetImages.xiaoxiPng,
      activeIcon: AssetImages.xiaoxiPng,
      label: "消息",
      width: 28,
    ),
    const BottomItem(
      icon: AssetImages.guanzhuPng,
      activeIcon: AssetImages.guanzhuPng,
      label: "关注",
      width: 28,
    ),
    const BottomItem(
      icon: AssetImages.mePng,
      activeIcon: AssetImages.mePng,
      label: "我的",
      width: 28,
    ),
  ];

  int tabBarIndex = 0;

  List<Widget> homePageList = [
    const HomePage(),
    const HomePage(),
    const MessagePage(),
    const FollowWithInterest(),
    const UserPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: homePageList[tabBarIndex],
        bottomNavigationBar: BottomButton(
          tabBarIndex: tabBarIndex,
          tabBarTap: tabBarTap,
          buttonList: tabList,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void tabBarTap(value) {
    setState(() {
      tabBarIndex = value;
    });
  }
}
