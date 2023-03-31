import 'package:flutter/material.dart';

import '../../common/assetImages.dart';

class MessageDetail extends StatefulWidget {
  final Map item;
  final int count;
  const MessageDetail({super.key, required this.item, required this.count});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  AnimationStatus? animationState;

  // 销售的标签
  List<Map> userData = [
    {"num": "95%", "content": "及时回复"},
    {"num": "568", "content": "带看客户"},
    {"num": "2年", "content": "从业年限"},
    {"num": "5.0", "content": "客户评价"}
  ];

  // 聊天记录
  List chatItems = [
    {
      "type": 1,
      "message": "fdaf地方撒风大撒风阿斯顿飞fd阿斯顿飞安德森发大水发大水发大水奋斗发的大撒风安德森 发大发大水发",
      "from": 1
    },
    {
      "type": 1,
      "message":
          "fdaf地方撒风大撒aa风阿斯顿飞ffdsafsfadsfadsfjlkjsadflkosdajfl asdjlffsaf水奋斗发的大撒风安德森 发大发大水发",
      "from": 1
    },
    {"type": 1, "message": "做紧d咩嘢?", "from": 2},
    {"type": 1, "message": "？？？", "from": 2},
    {"type": 1, "message": "做紧d咩嘢?", "from": 2},
    {"type": 1, "message": "？？？", "from": 2},
    {"type": 1, "message": "做紧d咩嘢?", "from": 2},
    {"type": 1, "message": "？？？", "from": 2},
    {"type": 1, "message": "做紧d咩嘢?", "from": 2},
    {"type": 1, "message": "？？？", "from": 2},
    {"type": 1, "message": "做紧d咩嘢?", "from": 2},
    {"type": 1, "message": "？？？", "from": 2},
    {
      "type": 1,
      "message": "fdaf地方撒风大撒风阿斯顿飞fd阿斯顿飞安德森发大水发大水发大水奋斗发的大撒风安德森 发大发大水发",
      "from": 1
    },
    {"type": 1, "message": "11111111", "from": 1},
    {
      "type": 1,
      "message": "111111",
      "img":
          "https://img0.baidu.com/it/u=618736129,972855535&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
      "from": 1
    },
  ];

  // List chatItems = [];

  // 是否聚焦
  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  // 是否输入框
  bool isInput = true;
  // 输入框内容
  late TextEditingController _controller;

  // 聊天快捷项目
  List chatShortcuts = ["常用语", "购房意向", "要微信", "聊过的房源"];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // chatItems = chatItem.reversed.toList();
    _focusNode.addListener(() {
      setState(() {
        isFocus = _focusNode.hasFocus;
      });
    });
    // 动画控制器
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    // 动画方式
    animation = Tween<double>(begin: 0, end: 130).animate(controller)
      ..addListener(() {
        print(animation.value);
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationState = state;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    controller.dispose();
  }

  // 让文字填充完一整行，不让留白
  String breakWord(String text) {
    if (text.isEmpty) {
      return text;
    }
    String breakWord = ' ';
    for (var element in text.runes) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B'; //'\u200B'不可见空格符
    }
    return breakWord;
  }

  // 聊天记录
  Widget _buildChatRecords() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        reverse: true,
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              textDirection:
                  chatItems[chatItems.length - 1 - index]['from'] == 1
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    "https://img0.baidu.com/it/u=618736129,972855535&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
                    fit: BoxFit.cover,
                  ),
                ),
                // const SizedBox(width: 4),
                Stack(
                  textDirection:
                      chatItems[chatItems.length - 1 - index]['from'] == 1
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      margin:
                          chatItems[chatItems.length - 1 - index]['from'] == 1
                              ? const EdgeInsets.only(right: 14)
                              : const EdgeInsets.only(left: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(maxWidth: 260),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chatItems[chatItems.length - 1 - index]['img'] != null
                              ? Image.asset(AssetImages.image1Png)
                              : const SizedBox(),
                          Text(
                            breakWord(chatItems[chatItems.length - 1 - index]
                                ['message']),
                          ),
                        ],
                      ),
                    ),
                    chatItems[chatItems.length - 1 - index]['from'] == 2
                        ? const Positioned(
                            left: 0,
                            top: 13,
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            ),
                          )
                        : const Positioned(
                            right: 0,
                            top: 13,
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          // 撑满
          Container(
            height: double.infinity,
          ),
          // 底层滚动的列表
          Positioned(
            top: 0,
            bottom: 106,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                controller.reverse();
                _focusNode.unfocus();
              },
              child: Container(
                color: const Color(0xffF5F5F7),
                child: _buildChatRecords(),
                // child: SingleChildScrollView(
                //   reverse: true,
                //   child: Padding(
                //     padding: const EdgeInsets.all(16),
                //     child: Column(
                //       children: chatItems.asMap().keys.map((e) {
                //         return Padding(
                //           padding: const EdgeInsets.only(bottom: 16),
                //           child: Row(
                //             textDirection: chatItems[e]['from'] == 1
                //                 ? TextDirection.rtl
                //                 : TextDirection.ltr,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 48,
                //                 height: 48,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(6),
                //                 ),
                //                 clipBehavior: Clip.antiAlias,
                //                 child: Image.network(
                //                   "https://img0.baidu.com/it/u=618736129,972855535&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //               // const SizedBox(width: 4),
                //               Stack(
                //                 textDirection: chatItems[e]['from'] == 1
                //                     ? TextDirection.rtl
                //                     : TextDirection.ltr,
                //                 children: [
                //                   Container(
                //                     padding: const EdgeInsets.all(14),
                //                     margin: chatItems[e]['from'] == 1
                //                         ? const EdgeInsets.only(right: 14)
                //                         : const EdgeInsets.only(left: 14),
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(6),
                //                     ),
                //                     constraints:
                //                         const BoxConstraints(maxWidth: 260),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         chatItems[e]['img'] != null
                //                             ? Image.asset(AssetImages.image1Png)
                //                             : const SizedBox(),
                //                         Text(
                //                           breakWord(chatItems[e]['message']),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   chatItems[e]['from'] == 2
                //                       ? const Positioned(
                //                           left: 0,
                //                           top: 13,
                //                           child: Icon(
                //                             Icons.arrow_left,
                //                             color: Colors.white,
                //                           ),
                //                         )
                //                       : const Positioned(
                //                           right: 0,
                //                           top: 13,
                //                           child: Icon(
                //                             Icons.arrow_right,
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                 ],
                //               )
                //             ],
                //           ),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
          // 操作按钮
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () {
                controller.forward();
              },
              child: Image.asset(AssetImages.group_1Png),
            ),
          ),
          // 弹出框
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {},
              child: AnimatedBuilder(
                animation: animation,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    //超出部分，可裁剪
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Image.network(
                                      "https://img1.baidu.com/it/u=2501886897,209737142&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "A",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "浑南区/芒果不动产·茉莉园店",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xff0FAB6B),
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: const [
                                  Icon(Icons.add, color: Color(0xff0FAB6B)),
                                  Text(
                                    "关注",
                                    style: TextStyle(
                                      color: Color(0xff0FAB6B),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: userData.asMap().keys.map((e) {
                              return Container(
                                padding: EdgeInsets.only(
                                    right: e != userData.length - 1 ? 22.5 : 0,
                                    left: 22.5),
                                decoration: e != userData.length - 1
                                    ? BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            width: 1,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                        ),
                                      )
                                    : const BoxDecoration(),
                                child: Column(
                                  children: [
                                    Text(
                                      userData[e]['num'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        height: 20 / 14,
                                      ),
                                    ),
                                    Text(
                                      userData[e]['content'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        height: 16 / 12,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
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
          ),
          // 底部操作栏
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 120,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Row(
                        children: chatShortcuts.map((e) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                ),
                                shape: const MaterialStatePropertyAll(
                                  StadiumBorder(
                                    side: BorderSide(
                                      color: Color(0xffD9D9DA),
                                    ),
                                  ),
                                ),
                                overlayColor: const MaterialStatePropertyAll(
                                  Color(0xff0FAB6B),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                            .contains(MaterialState.focused) &&
                                        !states
                                            .contains(MaterialState.pressed)) {
                                      //获取焦点时的颜色
                                      return Colors.white;
                                    } else if (states
                                        .contains(MaterialState.pressed)) {
                                      //按下时的颜色
                                      return Colors.white;
                                    }
                                    //默认状态使用灰色
                                    return Colors.black;
                                  },
                                ),
                              ),
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 6),
                      child: SizedBox(
                        height: 38,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isInput = !isInput;
                                });
                              },
                              child: Icon(
                                isInput ? Icons.volume_up : Icons.keyboard,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: isInput
                                  ? TextField(
                                      onSubmitted: (String value) {
                                        if (value.isEmpty) return;
                                        chatItems.add({
                                          // chatItems.insert(0, {
                                          "type": 1,
                                          "message": value,
                                          "from": 1
                                        });
                                        _controller.clear();
                                        FocusScope.of(context)
                                            .requestFocus(_focusNode);
                                        setState(() {});
                                      },
                                      controller: _controller,
                                      focusNode: _focusNode,
                                      cursorColor: Colors.black,
                                      cursorWidth: 1,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 0, bottom: 0, left: 8),
                                        fillColor: Colors.white, // 设置输入框背景色为灰色
                                        filled: true,
                                        // 聚焦的样式
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            color: Color(0xffD9D9DA),
                                            // width: 2.0,
                                          ),
                                        ),
                                        // 普通的样式
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            color: Color(0xffD9D9DA),
                                            // width: 2.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: const ButtonStyle(
                                          overlayColor:
                                              MaterialStatePropertyAll(
                                            Color(0xffD9D9DA),
                                          ),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.black,
                                          ),
                                        ),
                                        child: const Text("按住说话"),
                                      ),
                                    ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.mood,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toast.show(context: context, message: "提示");
        controller.reverse();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 80,
          leading: TextButton.icon(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            label: widget.count != 0
                ? Text(
                    "(${widget.count})",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : const Text(""),
            onPressed: () => {
              Navigator.of(context).pop('刷新'),
            },
          ),
          title: Text(
            widget.item['name'],
            style: const TextStyle(
              color: Color(0xff141419),
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: buildActions(), // 右上角图标
        ),
        body: _buildView(context),
      ),
    );
  }

  // 右上角图标弹出框
  List<Widget> buildActions() {
    return [
      PopupMenuButton<String>(
        itemBuilder: _buildItem, // 内容的显示
        onSelected: _onSelectItem, // 点击内容触发的
        icon: const Icon(Icons.call, color: Color(0xff262626)), // 按钮图标颜色
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
          child: Center(child: Text("拨打电话"))),
      PopupMenuItem<String>(
          value: "1", // 传给onSelected函数的值
          child: Center(child: Text("不知道写啥")))
    ];
  }

  // 点击弹窗内容触发
  void _onSelectItem(String value) {}
}
