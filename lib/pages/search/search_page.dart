import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // tab数据
  List<String> tabs = ["二手房", "租房", "小区"];
  // 搜索初始内容控制器
  TextEditingController controller = TextEditingController(text: "");

  // 搜索历史
  List<String> searchHistory = [
    "浑南新区",
    "优品天地2期",
    "汇智尚都3期",
    "大和",
    "太湖国际花园",
    "碧桂园"
  ];
  // 搜索结果
  List searchResult = [
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"},
    {"title": "万科紫金苑", "count": "41套", "name": "小区", "address": "浑南区-金阳街58号"}
  ];

  // 是否搜索
  bool isSearch = false;

  // 搜索内容
  String inputValue = "";

  // 是否聚焦
  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _focusNode.addListener(() {
      setState(() {
        isFocus = _focusNode.hasFocus;
      });
    });
  }

  // 搜索历史
  Widget _buildSearchHistory() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "搜索历史",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff222229),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    searchHistory = [];
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                // alignment: WrapAlignment.start,
                children: searchHistory.asMap().keys.map<Widget>((e) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        searchResult = searchResult.map((item) {
                          item['title'] = searchHistory[e];
                          return item;
                        }).toList();
                        inputValue = searchHistory[e];
                        controller.value = TextEditingValue(
                          text: searchHistory[e],
                          selection: TextSelection.fromPosition(
                            TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: searchHistory[e].length),
                          ),
                        );
                        isSearch = true;
                        // 失去焦点
                        _focusNode.unfocus();
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F5F7),
                      ),
                      margin: const EdgeInsets.only(right: 8, top: 9),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        searchHistory[e],
                        style: const TextStyle(
                          height: 18 / 13,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 搜索结果
  Widget _buildSearchPub() {
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xffE6E6E8),
              ),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    searchResult[index]['title'],
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xff222229)),
                  ),
                  Text(
                    searchResult[index]['count'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff222229),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F5F7),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: Text(
                      searchResult[index]['name'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff59595D),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    searchResult[index]['address'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff888889),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 11),
            ],
          ),
        );
      },
    );
  }

  // 搜索框
  Widget _buildSearchBox() {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  setState(() {
                    searchResult = searchResult.map((item) {
                      item['title'] = value;
                      return item;
                    }).toList();
                    isSearch = true;
                    searchHistory.insert(0, value);
                  });
                }
              },
              onChanged: (String val) {
                setState(() {
                  inputValue = val;
                });
                if (val.isEmpty && isSearch) {
                  setState(() {
                    isSearch = false;
                  });
                }
              },
              controller: controller,
              autofocus: true,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: "请输入搜索内容",
                contentPadding:
                    const EdgeInsets.only(top: 0, bottom: 0, left: 8),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0x3C3C3C3c),
                ),
                suffixIcon: inputValue.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            controller.clear();
                            inputValue = "";
                            isSearch = false;
                            FocusScope.of(context).requestFocus(_focusNode);
                          });
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Color(0x3C3C3C3c),
                        ),
                      )
                    // ? TextButton.icon(
                    //     onPressed: () {
                    //       setState(() {
                    //         controller.text = "";
                    //         inputValue = "";
                    //         isSearch = false;
                    //         FocusScope.of(context).requestFocus(_focusNode);
                    //       });
                    //     },
                    //     icon: const Icon(
                    //       Icons.clear,
                    //       color: Color(0x3C3C3C3c),
                    //     ),
                    //     label: const Text(""),
                    //   )
                    : null,
                fillColor: const Color(0xffF5F5F7), // 设置输入框背景色为灰色
                filled: true,
                // 聚焦的样式
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Color(0xffF5F5F7),
                    width: 2.0,
                  ),
                ),
                // 普通的样式
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Color(0xffF5F5F7),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            child: const Text(
              "取消",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff222229),
              ),
            ),
            onPressed: () {
              _focusNode.unfocus();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          labelColor: const Color(0xff0FAB6B),
          unselectedLabelColor: const Color(0xff222229),
          indicatorColor: const Color(0xff0FAB6B),
          onTap: (int index) {
            setState(() {
              controller.clear();
              inputValue = "";
              isSearch = false;
              FocusScope.of(context).requestFocus(_focusNode);
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
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 8, right: 16, left: 16),
        child: Column(
          children: [
            _buildSearchBox(),
            const SizedBox(height: 14),
            Expanded(
              child: TabBarView(
                key: UniqueKey(),
                physics: const NeverScrollableScrollPhysics(), // 不响应滑动
                //构建
                controller: _tabController,
                children: tabs.map((e) {
                  return isSearch ? _buildSearchPub() : _buildSearchHistory();
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
