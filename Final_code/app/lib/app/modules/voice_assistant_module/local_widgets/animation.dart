
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceAssistantAnimation extends StatefulWidget {
  VoiceAssistantAnimation({Key? key}) : super(key: key);

  @override
  State<VoiceAssistantAnimation> createState() => _VoiceAssitantAnimationState();
}

class _VoiceAssitantAnimationState extends State<VoiceAssistantAnimation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController animationController;
  late Animation bar1;
  late Animation bar2;
  late Animation bar3;
  late Animation bar4;
  late Animation bar5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    bar1 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 80.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 80.h, end: 0.0), weight: 10),
    ]).animate(animationController);
    bar2 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 40.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 40.h, end: 5.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 60.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 60.h, end: 5.0), weight: 10),
    ]).animate(animationController);
    bar3 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 60.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 60.h, end: 40.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 40.h, end: 73.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 73.h, end: 5.0), weight: 10),
    ]).animate(animationController);
    bar4 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 20.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 20.h, end: 5.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 80.h), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 80.h, end: 5.0), weight: 10),
    ]).animate(animationController);
    bar5 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 5.0, end: 80.h), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 80.h, end: 5.0), weight: 10),
    ]).animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画恢复到初始状态时执行动画（正向）
        animationController.forward();
      }
    });
    animationController.repeat(max: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IgnorePointer(
      child: Container(
        width: 264.w,
        height: 100.w,
        // color: Colors.yellow,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Bar(bar1.value),
            Bar(bar2.value),
            Bar(bar3.value),
            Bar(bar4.value),
            Bar(bar5.value),
            //
            Bar((bar1.value + bar2.value) / 2),
            Bar(bar2.value),
            Bar(bar1.value),
            Bar(bar4.value),
            Bar(bar3.value),
          ],
        ),
      ),
    );
  }

  Widget Bar(double height) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
    );
  }
}
