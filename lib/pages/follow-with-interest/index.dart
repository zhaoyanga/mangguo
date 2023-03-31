import 'package:flutter/material.dart';
import 'front_view.dart';

class FollowWithInterest extends StatefulWidget {
  const FollowWithInterest({super.key});
  @override
  State<FollowWithInterest> createState() => _FollowWithInterestState();
}

class _FollowWithInterestState extends State<FollowWithInterest>
    with SingleTickerProviderStateMixin {
  // tab控制器
  late TabController _tabController;
  // tab数据
  List<String> tabs = ["二手房", "租房", "新房", "小区"];
  // 页面数据
  List datas = [
    [
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': null,
        'priceStatus': "down",
        "follow": "36",
        'content': "近30天，调价1次，降价2.0万"
      },
      {
        'name': "北一新村，南北两室，装修好，看房方便",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已停售",
        'priceStatus': "up",
        'content': "近30天，调价1次，涨价2.0万",
        "follow": "110"
      },
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已成交",
        'priceStatus': "down",
        'content': "近30天，调价1次，降价2.0万",
        "follow": "9"
      },
    ],
    [
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': null,
        'priceStatus': "down",
        "follow": "36",
        'content': "近30天，调价1次，降价2.0万"
      },
      {
        'name': "北一新村，南北两室，装修好，看房方便",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已停售",
        'priceStatus': "up",
        'content': "近30天，调价1次，涨价2.0万",
        "follow": "110"
      },
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已成交",
        'priceStatus': "down",
        'content': "近30天，调价1次，降价2.0万",
        "follow": "9"
      },
    ],
    [
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': null,
        'priceStatus': "down",
        "follow": "36",
        'content': "近30天，调价1次，降价2.0万"
      },
      {
        'name': "北一新村，南北两室，装修好，看房方便",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已停售",
        'priceStatus': "up",
        'content': "近30天，调价1次，涨价2.0万",
        "follow": "110"
      },
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已成交",
        'priceStatus': "down",
        'content': "近30天，调价1次，降价2.0万",
        "follow": "9"
      },
    ],
    [
      {
        'name': "锦绣四合院，南北两室，不把山不临街，满五年",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': null,
        'priceStatus': "down",
        "follow": "36",
        'content': "近30天，调价1次，降价2.0万"
      },
      {
        'name': "北一新村，南北两室，装修好，看房方便",
        'describe': "126㎡/3室2厅/南北/金地南华府",
        'total': "157",
        'unit': "万",
        'price': "14315元/㎡",
        'status': "已停售",
        'priceStatus': "up",
        'content': "近30天，调价1次，涨价2.0万",
        "follow": "110"
      },
    ],
  ];

  // 点击的tab
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        globalKey.currentState!.cancal();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F7),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                isScrollable: true,
                labelColor: const Color(0xff0FAB6B),
                unselectedLabelColor: const Color(0xff222229),
                indicatorColor: const Color(0xff0FAB6B),
                onTap: (int index) {
                  globalKey.currentState!.cancal();
                  setState(() {
                    index = index;
                  });
                },
                // 选择的样式
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                // 未选中的样式
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                ),
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                controller: _tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: TextButton(
                  onPressed: () {
                    globalKey.currentState!.cancal();
                  },
                  child: const Text(
                    "编辑",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FrontView(
              data: datas[0],
              key: globalKey,
            ),
            FrontView(data: datas[1]),
            FrontView(data: datas[2]),
            FrontView(data: datas[3])
          ],
        ),
      ),
    );
  }
}
