import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusVerticalText extends StatelessWidget {
  const BusVerticalText({Key? key, required this.str, required this.fontWeight}) : super(key: key);
  final String str;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    int index = str.indexOf("（");
    String text;
    if (index > 0) {
      text = str.substring(0, index);
    } else {
      text = str;
    }
    List<Text> list = [];
    for (int i = 0; i < text.length; i++) {
      if (i > 10) {
        list.add(Text("...", style: TextStyle(fontSize: 36.sp, height: 0.5, fontWeight: FontWeight.bold)));
        break;
      }
      list.add(Text(text.substring(i, i + 1), style: TextStyle(fontSize: 28.sp, height: 1, fontWeight: fontWeight)));
    }
    return Column(mainAxisSize: MainAxisSize.min, children: list);
  }
}
