import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusLoadingAnimation extends StatefulWidget {
  const BusLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<BusLoadingAnimation> createState() => _BusAnimationState();
}

class _BusAnimationState extends State<BusLoadingAnimation> {
  late int index;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    index = 1;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        index++;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 110.w,
        height: 24.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: 10.h,
            height: 10.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index % 3 == 1 ? Colors.black : Colors.grey),
          ),
          Container(
            width: 10.h,
            height: 10.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index % 3 == 2 ? Colors.black : Colors.grey),
          ),
          Container(
            width: 10.h,
            height: 10.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index % 3 == 0 ? Colors.black : Colors.grey),
          )
        ]));
  }
}
