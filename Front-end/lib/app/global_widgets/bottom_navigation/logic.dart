import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'state.dart';

class BottomNavigationLogic extends GetxController {
  final BottomNavigationState state = BottomNavigationState();

  void toDeparture() {
    HapticFeedback.heavyImpact();
    if (state.currentPage == Routes.BUS) {
      state.currentPage = Routes.DEPARTURE;
      Get.offAndToNamed(Routes.DEPARTURE);
    } else {
      state.currentPage = Routes.DEPARTURE;
      Get.toNamed(Routes.DEPARTURE);
    }
  }

  void toMine() {
    HapticFeedback.heavyImpact();
    if (state.currentPage == Routes.BUS) {
      state.currentPage = Routes.MINE;
      Get.offAndToNamed(Routes.MINE);
    } else {
      state.currentPage = Routes.MINE;
      Get.toNamed(Routes.MINE);
    }
    state.currentPage = Routes.MINE;
  }
}
