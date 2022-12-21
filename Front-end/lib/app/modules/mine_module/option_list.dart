import 'package:app/app/modules/mine_module/local_widgets/option_item.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MineOptionList extends StatelessWidget {
  const MineOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 541.w,
      height: 499.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 4),
          boxShadow: const [BoxShadow(offset: Offset(2, 2), color: Colors.black, blurRadius: 5)]),
      child: Column(children: [
        const SizedBox(height: 10),
        const MineOptionItem(label: "我的订单"),
        const SizedBox(height: 10),
        const MineOptionItem(label: "我的钱包"),
        const SizedBox(height: 10),
        GestureDetector(onTap: () => Get.toNamed(Routes.COUPON), child: const MineOptionItem(label: "消费赞")),
      ]),
    );
  }
}
