import 'package:app/app/modules/login_module/local_widgets/animation.dart';
import 'package:app/app/modules/login_module/local_widgets/quick_login_button.dart';
import 'package:app/app/modules/login_module/local_widgets/three_party_login.dart';
import 'package:app/app/modules/login_module/local_widgets/top_left_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'local_widgets/agree_policy_text.dart';
import 'logic.dart';

class LoginModulePage extends StatelessWidget {
  const LoginModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<LoginModuleLogic>();
    // final state = Get.find<LoginModuleLogic>().state;

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                body: Stack(children: [
          Positioned(top: 72.77.h, left: 55.w, child: const LoginTopLeftLogo()),
          Positioned(top: 271.6.h, left: 117.w, child: const LoginAnimation()),
          Positioned(top: 671.6.h, left: 69.w + 3, child: const LoginQuickLoginButton()),
          Positioned(top: 857.6.h, child: const LoginAgreePolicyText()),
          Positioned(top: 1068.6.h, left: 107.w, child: const LoginThreePartyLogin()),
        ]))));
  }
}
