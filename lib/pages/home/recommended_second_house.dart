import 'package:flutter/material.dart';
import '../../common/assetImages.dart';

class RecommendedSecondHouse extends StatelessWidget {
  const RecommendedSecondHouse({super.key});

  // 横向滚动卡片
  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 135,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemExtent: 143,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Image.asset(AssetImages.cartItemPng),
                  const SizedBox(height: 8),
                  const Text(
                    "杏林花园 南北大户型现在只要998",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "总价175万 万科精装房 快来选购！",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // 主视图+标题
  Widget _buildView() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                children: [
                  TextSpan(
                    text: "推荐",
                    style: TextStyle(
                      color: Color(0xffF94B30),
                    ),
                  ),
                  TextSpan(
                    text: "二手房",
                    style: TextStyle(
                      color: Color(0xff222229),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: _buildCard(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
