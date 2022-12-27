import 'package:app/app/modules/app_module/app_controller.dart';
import 'package:app/app/modules/login_module/binding.dart';
import 'package:app/app/modules/login_module/view.dart';
import 'package:app/app/modules/start_module/view.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/theme/app_theme.dart';

void main() {
  Get.put(AppController());
  runApp(ScreenUtilInit(
    designSize: const Size(637, 1380.17),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        home: LoginModulePage(),
        initialBinding: LoginModuleBinding(),
        initialRoute: '/',
        theme: appThemeData,
        defaultTransition: Transition.fade,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
      );
    },
  ));
}
