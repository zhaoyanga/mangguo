import 'package:flutter/material.dart';

class BottomItem {
  final String icon;
  final String activeIcon;
  final String label;
  final double width;
  const BottomItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.width,
  });
}

class BottomButton extends StatelessWidget {
  int tabBarIndex;
  Function tabBarTap;
  List<BottomItem> buttonList;

  BottomButton(
      {super.key,
      required this.tabBarIndex,
      required this.tabBarTap,
      required this.buttonList});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BottomNavigationBar(
        items: buttonList.asMap().keys.map(buildItemButton).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: tabBarIndex,
        onTap: (value) => {tabBarTap(value)},
        //选中的颜色
        fixedColor: const Color(0xff0FAB6B),
        unselectedItemColor: const Color(0xBABABABA),
        selectedFontSize: 16, // 选中字体大小
        unselectedFontSize: 16, // 未选择字体大小
      ),
    );
  }

  BottomNavigationBarItem buildItemButton(int index) {
    BottomItem item = buttonList[index];
    return BottomNavigationBarItem(
      icon: Image.asset(
        item.icon,
        color: Colors.black,
        width: item.width,
        height: item.width,
      ),
      activeIcon: Image.asset(
        item.activeIcon,
        width: item.width,
        height: item.width,
        color: const Color(0xff0FAB6B),
      ),
      label: item.label,
    );
  }
}
