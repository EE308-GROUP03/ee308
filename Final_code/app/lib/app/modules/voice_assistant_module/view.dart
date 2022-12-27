import 'package:app/app/global_widgets/bottom_navigation/logic.dart';
import 'package:app/app/global_widgets/outline_font/view.dart';
import 'package:app/app/global_widgets/top_logo/view.dart';
import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/modules/voice_assistant_module/local_widgets/animation.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class VoiceAssistantScreen extends StatefulWidget {
  const VoiceAssistantScreen({Key? key}) : super(key: key);

  @override
  State<VoiceAssistantScreen> createState() => _VoiceAssistantScreenState();
}

class _VoiceAssistantScreenState extends State<VoiceAssistantScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    _animation = Tween(begin: 0.0, end: -0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoiceAssistantModuleLogic());
    final _state = controller.state;
    //安全区外背景色
    return Container(
        color: const Color(0xffFF5C00),
        //安全区域
        child: SafeArea(
            child: Scaffold(
                backgroundColor: const Color(0xffFF5C00),
                body: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                  // 左上角logo
                  Positioned(
                    top: 24.3.h,
                    left: 25.w,
                    child: const TopLogoComponent(
                      bgcolor: Colors.white,
                    ),
                  ),

                  Positioned(
                    bottom: AppController.safeAreaHeight / 2 - 50.h,
                    left: 187.w,
                    child: _positionedBox(),
                  ),
                  Positioned(
                      top: 76.3.h,
                      left: 375.w,
                      child: GestureDetector(
                          onTap: () => setState(() {
                                _state.languageChoose = !_state.languageChoose;
                                _arrowAnimate();
                              }),
                          child: Container(
                              width: 199.w,
                              height: 78.h,
                              color: _state.languageChoose ? const Color(0xffff995f) : null,
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Text(_state.languageList[_state.activeLanguageIndex],
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 4,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold)),
                                RotationTransition(
                                    turns: _animation,
                                    child: Image.asset("assets/images/voice_assistant_arrow_down.png",
                                        width: 50.w, height: 50.h))
                              ])))),
                  Positioned(top: AppController.safeAreaHeight / 2 + 400.h, child: _toDeparture()),
                  Positioned(top: 76.3.h + 78.h, left: 375.w, child: _languageBoxList())
                ]))));
  }

  Widget _languageBoxList() {
    List<Widget> _list = [];
    final _logic = Get.find<VoiceAssistantModuleLogic>();
    if (!_logic.state.languageChoose) {
      return Container();
    } else {
      for (int i = 0; i < 3; i++) {
        if (i != _logic.state.activeLanguageIndex) {
          _list.add(GestureDetector(
              onTap: () {
                setState(() {
                  _logic.state.languageChoose = false;
                  _logic.state.language = _logic.state.languageList[i];
                  _logic.state.activeLanguageIndex = i;
                  _arrowAnimate();
                });
              },
              child: Container(
                  width: 199.w,
                  height: 78.h,
                  decoration: const BoxDecoration(
                      color: Colors.white, border: Border(bottom: BorderSide(width: 1, color: Color(0xffff995f)))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(_logic.state.languageList[i],
                        style: TextStyle(
                            color: const Color(0xffff995f),
                            letterSpacing: 4,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 50.w, height: 50.h)
                  ]))));
        }
      }
      _list.add(Container(
          width: 199.w,
          height: 78.h,
          decoration: const BoxDecoration(
              color: Color(0xffff995f), border: Border(bottom: BorderSide(width: 1, color: Color(0xffff995f)))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("更多...",
                style: TextStyle(color: Colors.white, letterSpacing: 4, fontSize: 24.sp, fontWeight: FontWeight.bold)),
            SizedBox(width: 50.w, height: 50.h)
          ])));
      return SizedBox(width: 199.w, height: 78.h * 3 + 3, child: Column(children: _list));
    }
  }

  //使用一个矩形将  点击说话/中间按钮  进行定位
  Widget _positionedBox() {
    return GetBuilder<VoiceAssistantModuleLogic>(
        builder: (controller) => Container(
            width: 264.w,
            height: 337.16.h,
            clipBehavior: Clip.none,
            child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
              Positioned(left: 0, top: -114.h, child: OutlineFontComponent(text: "点 击 说 话", size: 55.sp)),
              Positioned(
                  top: 36.63.h,
                  left: -118.w,
                  child: Container(
                      width: 500.w,
                      height: 500.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xfffd8039)))),
              Positioned(
                  top: 136.63.h,
                  left: -18.w,
                  child: GestureDetector(
                      onTap: () {
                        if (controller.state.recording) {
                          controller.stopRecorder();
                        } else {
                          controller.record();
                        }
                      },
                      child: Container(
                          width: 300.w,
                          height: 300.w,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffffcc4a))))),
              Positioned(
                  top: 236.63.h,
                  left: 82.w,
                  child: GestureDetector(
                      onTap: () {
                        if (controller.state.recording) {
                          controller.stopRecorder();
                        } else {
                          controller.record();
                        }
                      },
                      child: Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.state.recording ? const Color(0xffffcc4a) : Colors.white)))),
              Positioned(
                  left: controller.state.recording ? 0 : 29.w + 82.w,
                  top: controller.state.recording ? 236.63.h : 16.37.h + 236.63.h,
                  child: controller.state.recording
                      ? VoiceAssistantAnimation()
                      : IgnorePointer(
                          child:
                              Image.asset("assets/images/voice_assistant_microphone.png", width: 42.w, height: 69.h)))
            ])));
  }

  Widget _toDeparture() {
    return Container(
        width: 237.w,
        height: 105.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
              onTap: () {
                HapticFeedback.heavyImpact();
                final _controller = Get.find<BottomNavigationLogic>();
                _controller.state.currentPage = Routes.DEPARTURE;
                Get.toNamed(Routes.DEPARTURE);
              },
              child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                Text("我要手动操作", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 28.sp)),
                Positioned(
                    right: -25.w,
                    bottom: -26.5.h,
                    child: Image.asset("assets/images/voice_assistant_pointing.png", width: 50.w, height: 53.h))
              ])),
        ));
  }

  void _arrowAnimate() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }
}
