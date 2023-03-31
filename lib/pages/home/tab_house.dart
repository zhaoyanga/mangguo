import 'package:flutter/material.dart';
import '../../common/assetImages.dart';

class TabHouse extends StatefulWidget {
  const TabHouse({super.key});

  @override
  State<TabHouse> createState() => _TabHouseState();
}

class _TabHouseState extends State<TabHouse>
    with SingleTickerProviderStateMixin {
  late TabController _tabC;
  List<String> tabs = ["二手房", "租房"];
  void _tabController() {
    _tabC = TabController(
      length: tabs.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    _tabController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tabars(),
          _tarbarview(),
        ],
      ),
    );
  }

  //tabars设置
  Widget _tabars() {
    return Row(
      children: [
        TabBar(
          labelColor: const Color(0xff0FAB6B),
          unselectedLabelColor: const Color(0xff222229),
          indicatorColor: const Color(0xff0FAB6B),

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
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          controller: _tabC,
          tabs: tabs
              .map(
                (label) => Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: Tab(text: label),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  //tab下的view
  Widget _tarbarview() {
    return Expanded(
      child: TabBarView(
          controller: _tabC,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //因为有两个tabar所以写死了两个Container
            //在实际开发中我们通过接口获取tabar和children的数量 用list存储
            Container(child: _setListData()),
            Container(child: _setListData()),
          ]),
    );
  }

  //tabarView里边的列表展示
  _setListData() {
    List myLists = [];
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "金地洋房四楼清水房三室二厅，精装拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "精装修 近地铁 拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "金地洋房四楼清水房三室二厅，精装拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "精装修 近地铁 拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "金地洋房四楼清水房三室二厅，精装拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });
    myLists.add({
      "img": AssetImages.ershoufangPng,
      "name": "精装修 近地铁 拎包入住",
      "desc": "126㎡/3室2厅/南北/金地南华府",
      "tag": ["近地铁", "电梯"],
      "price": "289",
      "m2": "14315元/㎡"
    });

    return Container(
      child: ListView.builder(
          itemCount: myLists.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var listBean = myLists[index];
            return InkWell(
              onTap: () {
                print("列表点击");
                print(listBean["tag"].asMap().keys.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: const Color(0xffF5F5F7),
                    ),
                    child: Text("${listBean["tag"][e]}"),
                  );
                }).toList());
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              '${listBean["img"]}',
                              width: 110.0,
                              height: 96,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 标题
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${listBean["name"]}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff222229),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // 描述
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      "${listBean["desc"]}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff222229),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: listBean["tag"]
                                        .asMap()
                                        .keys
                                        .map<Widget>((e) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          // border: Border.all(width: 1),
                                          color: Color(0xffF5F5F7),
                                        ),
                                        margin: const EdgeInsets.only(
                                            right: 4, top: 6, bottom: 6),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 1),
                                        child: Text("${listBean["tag"][e]}"),
                                      );
                                    }).toList(),
                                  ),
                                  // 价钱
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: "${listBean["price"]}",
                                              style: const TextStyle(
                                                color: Color(0xffF94B30),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const TextSpan(
                                              text: "万",
                                              style: TextStyle(
                                                color: Color(0xffF94B30),
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${listBean["m2"]}",
                                              style: const TextStyle(
                                                color: Color(0xff888889),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
