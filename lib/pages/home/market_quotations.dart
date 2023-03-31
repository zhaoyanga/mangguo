import 'package:flutter/material.dart';
import '../../common/assetImages.dart';

class MarketQuotations extends StatelessWidget {
  const MarketQuotations({super.key});

  // 边框线
  Widget _buildBoder() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffE6E6E8),
          ),
        ),
      ),
    );
  }

  // 头部内容
  Widget _buildTextContainer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "沈阳",
                      style: TextStyle(
                        color: Color(0xff222229),
                      ),
                    ),
                    TextSpan(
                      text: "行情",
                      style: TextStyle(
                        color: Color(0xff0FAB6B),
                      ),
                    ), //其他样式设置粗体
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 46),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "二手房",
                    style: TextStyle(
                      color: Color(0xff888889),
                      fontSize: 12,
                      height: 16 / 12,
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                        child: Text(
                          "0.03%",
                          style: TextStyle(
                            color: Color(0xff0BB769),
                            fontSize: 12,
                            height: 16 / 12,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff0BB769),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    "106666",
                    style: TextStyle(
                      color: Color(0xff222229),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " 元/m²",
                    style: TextStyle(
                      color: Color(0xff222229),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(width: 32),
          Column(
            children: const [
              Text(
                "昨日新增",
                style: TextStyle(
                  color: Color(0xff888889),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "491 套",
                style: TextStyle(
                  color: Color(0xff222229),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 中间内容
  Widget _buildAmong() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 39, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "帮",
                              style: TextStyle(color: Color(0xff0FAB6B))),
                          TextSpan(
                            text: "我找房",
                            style: TextStyle(
                              color: Color(0xff222229),
                            ),
                          ), //其他样式设置粗体
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      height: 16,
                      child: Image.asset(
                        AssetImages.likedingzhiPng,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "芒果专家 帮您找房 ",
                      style: TextStyle(color: Color(0xff222229), fontSize: 12),
                    ),
                    Text(
                      "推荐符合需求的房源",
                      style: TextStyle(color: Color(0xff222229), fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "立刻找房",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff0FAB6B)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Color(0xffE6E6E8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 39, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "我的房子",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "随时了解我的房产动向",
                    style: TextStyle(color: Color(0xff222229), fontSize: 12),
                  ),
                  SizedBox(height: 28),
                  Text(
                    "添加房产",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0FAB6B)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 底部内容
  Widget _buildHousekeeping() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "视频看房",
                      style: TextStyle(
                        color: Color(0xff222229),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "看视频找好房",
                      style: TextStyle(
                        color: Color(0xff888889),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Image.asset(
                  AssetImages.shipinkanfangPng,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Color(0xffE6E6E8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "VR看房",
                        style: TextStyle(
                          color: Color(0xff222229),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "足不出户看好房",
                        style: TextStyle(
                          color: Color(0xff888889),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    AssetImages.vrkanfangPng,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          // 文字内容
          _buildTextContainer(),
          // 边框线
          _buildBoder(),
          // 中间内容
          _buildAmong(),
          // 边框线
          _buildBoder(),
          // 底部内容
          _buildHousekeeping()
        ],
      ),
    );
  }
}
