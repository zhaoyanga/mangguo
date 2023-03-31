import 'package:flutter/material.dart';
import 'dart:async';

class Rotation extends StatefulWidget {
  List<String> swiperImage;
  final double? height;
  Rotation({super.key, required this.swiperImage, this.height});

  @override
  State<Rotation> createState() => _Rotation();
}

class _Rotation extends State<Rotation> {
  // 轮播图参数
  int _currentPage = 1000;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // initialPage 为初始化显示的子Item
    _pageController = PageController(initialPage: _currentPage);
    if (mounted == true && widget.swiperImage.isNotEmpty) {
      _setTimer();
    }
  }

  //设置定时器
  _setTimer() {
    //间隔两秒时间
    _timer = Timer.periodic(const Duration(seconds: 4), (value) {
      _currentPage++;
      //触发轮播切换
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
      //刷新
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 124,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: widget.swiperImage.length * 10000,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            widget.swiperImage[index % widget.swiperImage.length],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
