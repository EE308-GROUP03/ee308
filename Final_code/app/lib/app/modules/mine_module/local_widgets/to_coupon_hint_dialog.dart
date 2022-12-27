import 'package:app/app/modules/mine_module/local_widgets/option_item.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';

class toCouponHintDialogWidget extends StatelessWidget {
  const toCouponHintDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          left: 137.w,
          top: 474.94.h,
          child: Container(
            width: 466.w,
            height: 163.h,
            decoration: BoxDecoration(
                border: Border.all(width: 4),
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(-30.w, 30.w), color: const Color(0xffFFCC4A))]),
            child: Material(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "现在来看看消费赞吧",
                style: TextStyle(
                    color: CustomColor.get("main"), fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 24.sp),
              ),
              Text(
                "这里有许多优惠等着我们!",
                style: TextStyle(
                    color: CustomColor.get("main"), fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 24.sp),
              )
            ])),
          )),
      Positioned(
          left: 0,
          top: 475.94.h,
          child: Image.asset("assets/images/departure_hint_orange.png", width: 150.37.w, height: 178.52.h)),
      Positioned(
          left: 25.w,
          top: 807.6.h - 36.h,
          child: ClipOval(
              child: DottedBorder(
                  borderType: BorderType.Oval,
                  color: Colors.yellow,
                  strokeWidth: 8,
                  dashPattern: const [8, 8],
                  child: SizedBox(width: 578.w, height: 131.w)))),
      Positioned(
          left: 49.w,
          top: 802.h,
          child: Material(
              child:
                  GestureDetector(onTap: () => Get.offAndToNamed(Routes.COUPON), child: const MineOptionItem(label: "消费赞")))),
      Positioned(
          left: 549.w,
          top: 563.1.h,
          child: Image.asset("assets/images/visit_comsumption_coin_arrow.png", width: 75.3.w, height: 297.5.h - 36.h))
    ]);
  }
}
