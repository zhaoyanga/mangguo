import 'package:flutter/material.dart';

import '../../main.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F7),
      appBar: AppBar(
        title: const Text(
          "我的",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: buildActions(context),
      ),
      // body: ,
    );
  }

  // 右上角图标弹出框
  List<Widget> buildActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        itemBuilder: _buildItem, // 内容的显示
        onSelected: _onSelectItem, // 点击内容触发的
        icon: const Icon(Icons.home, color: Color(0xff262626)), // 按钮图标颜色
        position: PopupMenuPosition.under, // 弹窗位置
        shape: const RoundedRectangleBorder(
            // 设置弹窗形状
            borderRadius: BorderRadius.all(Radius.circular(10)) // 设置四边圆角
            ),
      )
    ];
  }

  // 弹窗内容
  List<PopupMenuEntry<String>> _buildItem(BuildContext context) {
    return const [
      PopupMenuItem<String>(
        value: "0", // 传给onSelected函数的值
        child: Center(
          child: Text("首页"),
        ),
      ),
    ];
  }

  // 点击弹窗内容触发
  void _onSelectItem(String value) {
    // 返回首页，清空路由
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyApp()),
        (route) => route == null);
  }
}
