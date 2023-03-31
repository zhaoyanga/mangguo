import 'package:flutter/material.dart';

class Toast {
  static void show({required BuildContext context, required String message}) {
    //建立一个OverlayEntry对象
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Center(
                child: Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(message),
                  ),
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context)!.insert(overlayEntry);
    //两秒后，移除Toast
    Future.delayed(const Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
