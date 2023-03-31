import 'package:flutter/material.dart';
import '../home/rotation.dart';
import '../../common/assetImages.dart';
import 'my.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // 轮播图数据
  final List<String> _swiperImage = [
    "assets/images/userImg1.png",
    "assets/images/userImg1.png",
    "assets/images/userImg1.png",
    "assets/images/userImg1.png",
    "assets/images/userImg1.png"
  ];

  // 买卖房
  final List buyHouses = [
    {"img": AssetImages.shangyongfangPng, 'name': "我要卖房"},
    {"img": AssetImages.fujinmendianPng, 'name': "我要出租"},
    {"img": AssetImages.fangchanbaikePng, 'name': "我要估价"},
  ];

  // 功能栏
  final List funcBars = [
    {"img": AssetImages.shangyongfangPng, "name": "我的合同"},
    {"img": AssetImages.shangyongfangPng, "name": "到家服务"},
    {"img": AssetImages.shangyongfangPng, "name": "房贷计算"},
    {"img": AssetImages.shangyongfangPng, "name": "税费计算"},
    {"img": AssetImages.shangyongfangPng, "name": "房产百科"},
    {"img": AssetImages.shangyongfangPng, "name": "帮我找房"},
  ];

  int lengtn = 1;

  // 个人信息
  Widget _buildUserInfo() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Image.asset(
            AssetImages.userImgJpg,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("昭阳"),
            const SizedBox(height: 2),
            InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xff59595D),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "编辑个人信息",
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  // 出租卖房
  Widget _buildBuyHouse() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buyHouses.asMap().keys.map((e) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              decoration: e != buyHouses.length - 1
                  ? const BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1, color: Color(0xffE6E6E8)),
                      ),
                    )
                  : const BoxDecoration(),
              child: Row(
                children: [
                  Image.asset(
                    buyHouses[e]['img'],
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(buyHouses[e]['name']),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 功能栏
  Widget _buildFunctionBar() {
    return Material(
      // 因为在 Container 中设置颜色，会覆盖 InkWell 的水波纹效果，可以套一层 Material 设置颜色
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        width: double.infinity,
        child: Wrap(
          children: funcBars.asMap().keys.map((e) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.7, vertical: 16),
                child: Column(
                  children: [
                    Image.asset(funcBars[e]['img']),
                    const SizedBox(height: 6),
                    Text(funcBars[e]['name']),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 个人信息
            _buildUserInfo(),
            const SizedBox(height: 16),
            // 收藏关注记录
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [Text("26"), Text("收藏关注")],
                ),
                Column(
                  children: const [Text("345"), Text("浏览记录")],
                ),
                Column(
                  children: const [Text("8"), Text("关注小区")],
                ),
                Column(
                  children: const [Text("15"), Text("搜索订阅")],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Rotation(swiperImage: _swiperImage, height: 86),
            ),
            // 卡片
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              height: 190,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: itemBuilder,
                onPageChanged: (int val) {
                  setState(() {
                    lengtn = val + 1;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            _buildBuyHouse(),
            const SizedBox(height: 10),
            _buildFunctionBar(),
          ],
        ),
      ),
    );
  }

  // 卡片项
  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xffE6E6E8)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("我是业主"),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "$lengtn"),
                            const TextSpan(text: "/2"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          AssetImages.group_2Png,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "万科城市阳光",
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "3室1厅/88㎡/南北",
                            style: TextStyle(
                              fontSize: 12,
                              height: 16 / 12,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "120万",
                            style: TextStyle(
                              color: Color(0xffF94B30),
                              fontSize: 12,
                              height: 16 / 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetImages.roundPng),
                    const SizedBox(width: 4),
                    const Text(
                      "您还未委托房源",
                      style: TextStyle(
                        fontSize: 12,
                        height: 16 / 12,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    print(11111);
                  },
                  child: Row(
                    children: const [
                      Text(
                        "去卖房",
                        style: TextStyle(
                          color: Color(0xff0FAB6B),
                          fontSize: 12,
                          height: 16 / 12,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xff0FAB6B),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F7),
        elevation: 0,
        title: const Text(
          "个人中心",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.support_agent, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildView(),
    );
  }
}
