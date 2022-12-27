import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/custom_color.dart';

class HelpButtonComponent extends StatelessWidget {
  const HelpButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _logic = Get.find<AppController>();
    return SizedBox(
        width: 215.w,
        height: 80.h,
        // color: Colors.white,
        child: Row(children: [
          Text("请 求 协 助",
              style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.get("main"), fontSize: 22.sp)),
          Obx(() => CupertinoSwitch(
              value: _logic.assist.value,
              onChanged: (bool value) {
                HapticFeedback.heavyImpact();
                _logic.assistChange();
              },
              activeColor: CustomColor.get("main")))
        ]));
  }
}
