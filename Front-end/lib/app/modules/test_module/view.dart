import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class OnePosition extends StatefulWidget {
  const OnePosition({Key? key}) : super(key: key);

  @override
  State<OnePosition> createState() => _OnePositionState();
}

class _OnePositionState extends State<OnePosition> {
  List<TargetFocus> targets = [];
  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton4 = GlobalKey();
  GlobalKey keyButton5 = GlobalKey();

  @override
  void initState() {
    targets.add(TargetFocus(identify: "Target 1", keyTarget: keyButton, contents: [
      TargetContent(
          align: ContentAlign.bottom,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Titulo lorem ipsum",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));

    targets.add(TargetFocus(identify: "Target 2", keyTarget: keyButton4, contents: [
      TargetContent(
          align: ContentAlign.left,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Multiples content",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
      TargetContent(
          align: ContentAlign.top,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Multiples content",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));

    targets.add(TargetFocus(identify: "Target 3", keyTarget: keyButton5, contents: [
      TargetContent(
          align: ContentAlign.right,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Title lorem ipsum",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 1.sw,
          height: 1.sh,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(top: 80, child: Container(key: keyButton, width: 50, height: 50, color: Colors.black)),
              Positioned(top: 160, child: Container(key: keyButton4, width: 50, height: 50, color: Colors.yellow)),
              Positioned(top: 240, child: Container(key: keyButton5, width: 50, height: 50, color: Colors.red)),
              Positioned(top: 320, child: GestureDetector(onTap: ()=>showTutorial(), child: Container(width: 50, height: 50, color: Colors.green)))
            ],
          )),
    );
  }

  void showTutorial() {
    TutorialCoachMark(
      targets: targets,
      // List<TargetFocus>
      colorShadow: Colors.red,
      // DEFAULT Colors.black
      // alignSkip: Alignment.bottomRight,
      // textSkip: "SKIP",
      // paddingFocus: 10,
      // opacityShadow: 0.8,
      onClickTarget: (target) {
        print(target);
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print("clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print(target);
      },
      onSkip: () {
        print("skip");
      },
      onFinish: () {
        print("finish");
      },
    ).show(context: context);
  }
}
