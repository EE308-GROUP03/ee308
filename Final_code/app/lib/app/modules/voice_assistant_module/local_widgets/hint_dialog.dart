
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';

class VoiceAssistantHintWidget extends Dialog {
  const VoiceAssistantHintWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 300.w,
            height: 300.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffffcc4a),
            ),
          ),
          Container(
            width: 100.w,
            height: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Image.asset(
            "assets/images/voice_assistant_microphone.png",
            width: 42.w,
            height: 69.h,
          ),
          ClipOval(
            child: DottedBorder(
              borderType: BorderType.Oval,
              color: Colors.yellow,
              strokeWidth: 8,
              dashPattern: const [8, 8],
              child: SizedBox(
                width: 400.w,
                height: 400.w,
              ),
            ),
          ),
          Positioned(
            left: 127.36.w,
            top: 184.45.h,
            child: Material(
              child: Container(
                width: 420.64.w,
                height: 206.36.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(-32.h, 32.h),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "您好! 我是小路~ ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 26.sp,
                          color: CustomColor.get("main")),
                    ),
                    Text(
                      "请点击圆圈的任意部分",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 26.sp,
                          color: CustomColor.get("main")),
                    ),
                    Text(
                      "并尝试说出您的需求",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 26.sp,
                          color: CustomColor.get("main")),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "如: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              fontSize: 26.sp,
                              color: CustomColor.get("main")),
                          children: [
                            TextSpan(
                              text: "我 要 坐 公 交 车",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34.sp,
                                  color: Colors.black),
                            )
                          ]),
                      textDirection: TextDirection.ltr,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 25.w,
              top: 214.72.h,
              child: Image.asset(
                "assets/images/voice_assistant_hint_orange.png",
                width: 140.21.w,
                height: 143.54.h,
              )),
          Positioned(
              left: 475.w,
              top: 358.45.h,
              child: Image.asset(
                "assets/images/voice_assistant_hint_arrow.png",
                width: 91.w,
                height: 250.h,
              )),
          Positioned(
              left: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  color: Colors.black.withOpacity(0),
                  width: 1.sw,
                  height: AppController.safeAreaHeight,
                ),
              ))
        ]);
  }
}
