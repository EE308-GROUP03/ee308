import 'package:app/app/modules/login_module/local_widgets/agree_policy_hint_dialog.dart';
import 'package:app/app/modules/login_module/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginQuickLoginButton extends StatelessWidget {
  const LoginQuickLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Get.find<LoginModuleLogic>().state;

    final controller = Get.find<LoginModuleLogic>();
    return GestureDetector(
        onTap: () {
          HapticFeedback.heavyImpact();
          if (!state.agree) {
            Get.dialog(const LoginAgreePolicyHintDialog());
          } else {
            controller.quickLogin();
          }
        },
        child: Container(
            width: 500.w - 6,
            height: 120.h - 6,
            decoration: BoxDecoration(
                color: const Color(0xffFFCC4A),
                borderRadius: BorderRadius.circular(60.h),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Center(
                child: Text("本机号码一键登录",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 36.sp)))));
  }
}
