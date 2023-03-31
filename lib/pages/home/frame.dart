import 'package:flutter/cupertino.dart';

class FrameItem extends StatelessWidget {
  const FrameItem(
      {super.key,
      required this.text,
      required this.imgUrl,
      required this.colorList});
  final String text;
  final String imgUrl;
  final List<Color> colorList;

  Widget _buildContainer() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Image.asset(imgUrl),
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: const TextStyle(
            color: Color(0xff222229),
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildView() {
    return Column(
      children: [
        _buildContainer(),
        _buildText(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
