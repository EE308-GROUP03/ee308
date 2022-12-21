import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineOptionItem extends StatelessWidget {
  const MineOptionItem({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff999999).withOpacity(0.05),
        height: 71.h,
        width: 541.w,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp)),
          Image.asset("assets/images/mine_arrow_small.png",
              width: 84.w, height: 43.h)
        ]));
  }
}
