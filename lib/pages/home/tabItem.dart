import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  const TableItem({super.key, required this.tabList});
  final List<Map<String, String>> tabList;

  // 每一项
  Widget _buildItem(String text, String imgURL) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 19,
            right: 19,
            bottom: 8,
          ),
          child: Image.asset(imgURL),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: tabList
            .asMap()
            .keys
            .map((e) => _buildItem(tabList[e]['text']!, tabList[e]['imgURL']!))
            .toList()

        // TableItem()
        ,
      ),
    );
  }
}
