import 'package:flutter/material.dart';
import 'package:mango_online/pages/login/login.dart';

import '../../main.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  final List tabList = [
    {"name": "收藏的二手房", "page": ""},
    {"name": "收藏的租房", "page": ""},
    {"name": "收藏的新房", "page": ""},
    {"name": "收藏的小区", "page": ""},
    {"name": "收藏的经纪人", "page": ""},
    {"name": "浏览记录", "page": ""},
    {"name": "我的房源", "page": ""},
    {"name": "我的合同", "page": ""},
  ];

  final bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Color(0xff222229),
      fontSize: 16,
    );
    const iconColor = Color(0xff222229);
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
      body: SingleChildScrollView(
        child: isLogin
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color(0xff0FAB6B),
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Image.network(
                            "https://img0.baidu.com/it/u=618736129,972855535&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "欢迎您，157****2700",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: Column(
                      children: tabList.asMap().keys.map((index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => tabList[index]['page'](),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tabList[index]['name'],
                                  style: textStyle,
                                ),
                                const Icon(Icons.chevron_right,
                                    color: iconColor),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Center(
                          child: Text(
                            "退出登录",
                            style: textStyle,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text("去注册/登录"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
      ),
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
