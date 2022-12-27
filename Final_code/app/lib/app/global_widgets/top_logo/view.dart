import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLogoComponent extends StatelessWidget {
  final Color? bgcolor;

  const TopLogoComponent({Key? key, this.bgcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 201.w,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.h), color: bgcolor),
        child: Stack(children: [
          Image.asset("assets/images/top_logo.png",
              width: 185.64.w, height: 80.h)
        ]));
  }
}
