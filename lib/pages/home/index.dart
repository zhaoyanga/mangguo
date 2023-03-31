import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import '../../common/assetImages.dart';
import 'rotation.dart';
import 'frame.dart';
import 'market_quotations.dart';
import 'tabItem.dart';
import 'real_time_info.dart';
import 'recommended_second_house.dart';
import '../search/search_page.dart';
import 'tab_house.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // 轮播图数据
  final List<String> _swiperImage = [
    "assets/images/swiper.jpg",
    "assets/images/swiper.jpg",
    "assets/images/swiper.jpg",
    "assets/images/swiper.jpg",
    "assets/images/swiper.jpg"
  ];
  // tab数据
  final List<Map<String, String>> tabList = [
    {
      "text": "登记房源",
      "imgURL": AssetImages.dengjifangyuanPng,
    },
    {
      "text": "帮我找房",
      "imgURL": AssetImages.bangwozhaofangPng,
    },
    {
      "text": "商用房",
      "imgURL": AssetImages.shangyongfangPng,
    },
    {
      "text": "计算器",
      "imgURL": AssetImages.jisuanqiPng,
    },
    {
      "text": "房产估价",
      "imgURL": AssetImages.fangchangujiaPng,
    },
    {
      "text": "贷款知识",
      "imgURL": AssetImages.daikuanzhishiPng,
    },
    {
      "text": "房产百科",
      "imgURL": AssetImages.fangchanbaikePng,
    },
    {
      "text": "房产估价",
      "imgURL": AssetImages.fangchangujia_2Png,
    },
    {
      "text": "附近门店",
      "imgURL": AssetImages.fujinmendianPng,
    },
    {
      "text": "经纪人",
      "imgURL": AssetImages.jingjirenPng,
    },
  ];

  // 主视图
  Widget _buildView(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return ExtendedNestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          //标题
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: const Color(0xffF5F5F7),
            elevation: 0,
            title: SizedBox(
              // 搜索框
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  width: 1, color: const Color(0x3C3C3C3c)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 10,
                            child: Center(
                              child: Row(
                                children: const [
                                  Icon(Icons.search, color: Color(0x3C3C3C3c)),
                                  SizedBox(width: 8),
                                  Text(
                                    "搜索附近的小区",
                                    style: TextStyle(
                                      color: Color(0x3C3C3C3c),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton.icon(
                    icon: const Icon(
                      Icons.location_on,
                      color: Color(0xff222222),
                      size: 24,
                    ),
                    label: const Text(
                      "地图",
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 16, top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 14),
                  // 轮播图
                  Rotation(swiperImage: _swiperImage),
                  const SizedBox(height: 14),
                  // frame
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      FrameItem(
                        text: "二手房",
                        imgUrl: AssetImages.homePng,
                        colorList: [
                          Color(0xff1BD1C2),
                          Color(0xff00BDAD),
                        ],
                      ),
                      FrameItem(
                        text: "租房",
                        imgUrl: AssetImages.zufangPng,
                        colorList: [
                          Color(0xffFDA714),
                          Color(0xffFD8B04),
                        ],
                      ),
                      FrameItem(
                        text: "新房",
                        imgUrl: AssetImages.xinfangPng,
                        colorList: [
                          Color(0xff32ACFF),
                          Color(0xff1394F2),
                        ],
                      ),
                      FrameItem(
                        text: "找小区",
                        imgUrl: AssetImages.zhaoxiaoquPng,
                        colorList: [
                          Color(0xffFE6F66),
                          Color(0xffFD5043),
                        ],
                      ),
                      FrameItem(
                        text: "地图找房",
                        imgUrl: AssetImages.dituzhaofangPng,
                        colorList: [
                          Color(0xff32ACFF),
                          Color(0xff1394F2),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // tab栏
                  TableItem(
                    tabList: tabList,
                  ),
                  const SizedBox(height: 10),
                  // 最新资讯
                  const RealTimeInfo(),
                  const SizedBox(height: 10),
                  // 行情区
                  const MarketQuotations(),
                  const SizedBox(height: 10),
                  // 推荐二手房
                  const RecommendedSecondHouse(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ];
      },
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      onlyOneScrollInBody: true,
      body: const TabHouse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(context),
      backgroundColor: const Color(0xffF5F5F7),
    );
  }
}
