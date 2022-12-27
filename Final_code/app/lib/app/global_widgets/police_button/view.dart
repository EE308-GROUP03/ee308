import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/custom_color.dart';

class PoliceButtonComponent extends StatelessWidget {
  const PoliceButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 240.w,
        height: 80.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 5),
          boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 10)],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: CustomColor.get("main"),
        ),
        child: Material(
          color: CustomColor.get("main"),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
              splashColor: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              highlightColor: CustomColor.get("main").withOpacity(0.5),
              onTap: () async {
                HapticFeedback.heavyImpact();
                var _url = Uri.parse("tel:110");
                try {
                  await launchUrl(_url);
                } catch (e) {
                  printError();
                }
              },
              child: Center(
                  child: Text("一键报警",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.sp, letterSpacing: 5)))),
        ));
  }
}
