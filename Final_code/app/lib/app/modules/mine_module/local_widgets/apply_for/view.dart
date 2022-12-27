import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color.dart';
import 'logic.dart';

class ApplyForComponent extends StatelessWidget {
  final logic = Get.find<ApplyForLogic>();
  final state = Get.find<ApplyForLogic>().state;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ApplyForLogic());
    return Stack(alignment: Alignment.center, children: [
      Container(
          width: 433.w,
          height: 772.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 5),
              color: Colors.white),
          child: Material(
              borderRadius: BorderRadius.circular(15),
              child: Stack(clipBehavior: Clip.none, children: [
                //新的亲友文本
                Positioned(
                    left: 149.w,
                    top: 62.h,
                    child: Text("新的亲友",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp))),
                //中间两个输入框 以及搜索结果
                Positioned(left: 49.w, top: 149.h, child: _applyFrom()),
                //发送好友请求按钮
                Positioned(
                    left: 180.w,
                    top: 612.h,
                    child: GestureDetector(
                      onTap: () => _controller.sendRequest(),
                      child: Image.asset(
                        "assets/images/apply_for_hook.png",
                        width: 73.w,
                        height: 73.w,
                      ),
                    )),
                Positioned(
                    left: 180.w,
                    bottom: -140.h,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        "assets/images/app_for_close.png",
                        width: 73.w,
                        height: 73.w,
                      ),
                    )),
                Positioned(
                    left: -196.w,
                    top: -88.h,
                    child: Image.asset("assets/images/apply_for_orange.png"),
                    width: 302.42.w,
                    height: 300.h)
              ])))
    ]);
  }

  Widget _applyFrom() {
    return GetBuilder<ApplyForLogic>(builder: (controller) {
      List<Widget> _list = [];
      _list.add(
        Material(
            child: Container(
                width: 336.w,
                height: 100.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TA的账号",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.sp),
                      ),
                      Container(
                          width: 191.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius: BorderRadius.circular(10.h)),
                          child: TextField(
                            controller: controller.state.phone,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ]))),
      );
      if (controller.state.find) {
        _list.add(
          Material(
            child: Container(
                width: 336.w,
                height: 96.67.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.h),
                    color: CustomColor.get("main")),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "您要找的可能是: ",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Container(
                    width: 50.h,
                    height: 50.h,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: ClipOval(
                      child: Image.network(
                        controller.state.userModel.avatar ?? '',
                        width: 50.h,
                        height: 50.h,
                        errorBuilder: (_1, _2, _3) => Image.asset(
                          "assets/images/departure_hint_orange.png",
                          width: 50.h,
                          height: 50.h,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    " ${controller.state.userModel.nickname ?? ''} ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      "assets/images/app_for_close.png",
                      width: 15.h,
                      height: 15.h,
                    ),
                  )
                ])),
          ),
        );
      }
      _list.add(Material(
          child: SizedBox(
              width: 336.w,
              height: 100.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TA是我的",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.sp)),
                    Container(
                        width: 191.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3),
                            borderRadius: BorderRadius.circular(10.h)),
                        child: TextField(
                            controller: controller.state.mark,
                            // maxLength: 11,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                border: InputBorder.none)))
                  ]))));
      return SizedBox(
        width: 336.w,
        height: 330.h,
        child: Column(children: _list),
      );
    });
  }
}
