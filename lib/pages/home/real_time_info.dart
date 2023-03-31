import 'package:flutter/material.dart';
import '../../common/assetImages.dart';

class RealTimeInfo extends StatelessWidget {
  const RealTimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0Xff222229),
    );

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 12, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(AssetImages.textPng),
          const Expanded(child: SizedBox(width: 12)),
          SizedBox(
            width: 196,
            child: Text(
              "这是资讯信息一行展示显示不全请注意查看",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Expanded(child: SizedBox(width: 12)),
          const Text(
            "|",
            style: TextStyle(color: Color(0xffE6E6E8)),
          ),
          const Expanded(child: SizedBox(width: 12)),
          Text(
            "更多",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
