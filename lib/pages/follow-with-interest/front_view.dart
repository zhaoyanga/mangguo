import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/assetImages.dart';

final GlobalKey<_FrontView> globalKey = GlobalKey();

class FrontView extends StatefulWidget {
  List data;
  FrontView({Key? key, required this.data}) : super(key: key);

  @override
  State<FrontView> createState() => _FrontView();
}

class _FrontView extends State<FrontView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late Animation<double> animation;
  late AnimationController controller;
  AnimationStatus? animationState;

  // 保持页面状态，混入AutomaticKeepAliveClientMixin，重写方法，在build前调用super.build(context)
  @override
  get wantKeepAlive => true;

  // 开关状态
  bool isChange = true;
  // 选项数据
  List selects = [
    {"text": "排序", "isSelect": true},
    {"text": "小区", "isSelect": true},
    {"text": "状态", "isSelect": true}
  ];
  // 当前点击的哪个
  int index = 3;

  // 状态列表点击
  int statusCount = 2;

  // 是否关注
  bool isFollow = true;
  // 用来做操作的数据
  List itemList = [];

  // 取消事件
  void cancal() {
    controller.reverse();
    setState(() {
      selects[2]['isSelect'] = true;
    });
  }

  @override
  void initState() {
    super.initState();
    itemList = copyWithList(widget.data.map((e) => e).toList());
    // 动画控制器
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    // 动画方式
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value == 0.0 && index != 2) {
            setState(() {
              selects[2]['isSelect'] = true;
            });
          }
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationState = state;
        });
      });
  }

  // 列表每一项
  Widget _buildItem() {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Opacity(
                        opacity: itemList[index]['status'] != null ? 0.5 : 1,
                        child: Image.asset(
                          AssetImages.image1Png,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            itemList.removeAt(index);
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            color: Colors.black.withOpacity(0.6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AssetImages.aixinPng),
                                const SizedBox(width: 4),
                                Text(
                                  '${itemList[index]['follow']}人关注',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    height: 16 / 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemList[index]['status'] != null
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            child: Text(
                              itemList[index]['status'],
                              style: const TextStyle(
                                color: Color(0xff222229),
                                fontSize: 16,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 12, left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemList[index]['name'],
                        style: const TextStyle(
                          color: Color(0xff222229),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        itemList[index]['describe'],
                        style: const TextStyle(
                          color: Color(0xff222229),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemList[index]['total'],
                            style: const TextStyle(
                              color: Color(0xffF94B30),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            itemList[index]['unit'],
                            style: const TextStyle(
                              color: Color(0xffF94B30),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            itemList[index]['price'],
                            style: const TextStyle(
                              color: Color(0xff888889),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            itemList[index]['priceStatus'] == 'down'
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: const Color(
                              0xff0DDD75,
                            ),
                            size: 24,
                          ),
                          Text(
                            itemList[index]['content'],
                            style: const TextStyle(
                              color: Color(
                                0xff0DDD75,
                              ),
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // 主视图
  Widget _buildView() {
    return SizedBox(
      child: Stack(
        children: [
          // 撑满
          Container(
            height: double.infinity,
          ),
          // 底层滚动的列表
          Positioned(
            top: 50,
            bottom: 12,
            left: 0,
            right: 0,
            child: itemList.isNotEmpty
                ? _buildItem()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetImages.nullPng),
                      const SizedBox(height: 8),
                      const Text("还没有关注的房源，快去看一下吧"),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff0FAB6B))),
                        child: const Text("马上去看看"),
                      )
                    ],
                  ),
          ),
          // 选项栏
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: selects.asMap().keys.map(
                        (e) {
                          return InkWell(
                            onTap: () {
                              if (selects[e]['text'] == '排序') {
                                itemList = itemList.reversed.toList();
                              }
                              setState(() {
                                index = e;
                                for (int i = 0; i < selects.length; i++) {
                                  if (e == i) {
                                    setState(() {
                                      selects[e]['isSelect'] =
                                          !selects[e]['isSelect'];
                                    });
                                    if (e == 2) {
                                      selects[e]['isSelect']
                                          ? controller.reverse()
                                          : controller.forward();
                                    } else {
                                      controller.reset();
                                    }
                                  } else {
                                    setState(() {
                                      selects[i]['isSelect'] = true;
                                    });
                                  }
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  selects[e]['text'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: index == e
                                          ? Colors.green
                                          : Colors.black),
                                ),
                                Icon(selects[e]['isSelect']
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "通知",
                          style: TextStyle(
                            color: Color(0xff0FAB6B),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        value: isChange,
                        onChanged: (bool val) {
                          setState(() {
                            isChange = val;
                          });
                        },
                        activeColor: const Color(0xff0FAB6B),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // 阴影
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            bottom: 0,
            child: !selects[2]['isSelect']
                ? SizedBox(
                    child: InkWell(
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          // 这里是下拉框下方阴影 点击阴影隐藏下拉框
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black.withOpacity(0.5),
                          );
                        },
                      ),
                      onTap: () {
                        cancal();
                      },
                    ),
                  )
                : const SizedBox(),
          ),
          // 弹出框
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: animation,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        statusCount = 2;
                        selects[2]['text'] = '状态';
                        itemList = widget.data;
                        cancal(); // 因为这个函数中有setState，所以上面不用写
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: statusCount == 2
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                            const Text(
                              "全部",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        statusCount = 0;
                        selects[2]['text'] = '已停售';
                        itemList = widget.data
                            .where((element) => element['status'] == "已停售")
                            .toList();
                        cancal(); // 因为这个函数中有setState，所以上面不用写
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: statusCount == 0
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                            const Text(
                              "已停售",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        statusCount = 1;
                        selects[2]['text'] = '已成交';
                        itemList = widget.data
                            .where((element) => element['status'] == "已成交")
                            .toList();
                        cancal();
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: statusCount == 1
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                            const Text(
                              "已成交",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              builder: (context, child) {
                return Container(
                  height: animation.value,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Colors.white,
                  ),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: const Color(0xffF5F5F7),
      child: _buildView(),
    );
  }

  // 数组拷贝
  List copyWithList(List list) {
    List copyList = [];
    for (var item in list) {
      if (item is Map) {
        copyList.add(Map.from(item));
      } else if (item is List) {
        copyList.add(copyWithList(item));
      } else {
        copyList.add(item);
      }
    }
    return copyList;
  }
}
