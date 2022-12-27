import 'package:app/app/modules/bus_line_module/binding.dart';
import 'package:app/app/modules/bus_line_module/view.dart';
import 'package:app/app/modules/bus_module/binding.dart';
import 'package:app/app/modules/bus_module/view.dart';
import 'package:app/app/modules/coupon_module/binding.dart';
import 'package:app/app/modules/coupon_module/view.dart';
import 'package:app/app/modules/departure_module/binding.dart';
import 'package:app/app/modules/departure_module/view.dart';
import 'package:app/app/modules/friend_module/binding.dart';
import 'package:app/app/modules/friend_module/view.dart';
import 'package:app/app/modules/login_module/binding.dart';
import 'package:app/app/modules/login_module/view.dart';
import 'package:app/app/modules/login_phone_module/binding.dart';
import 'package:app/app/modules/login_phone_module/view.dart';
import 'package:app/app/modules/mine_module/binding.dart';
import 'package:app/app/modules/mine_module/view.dart';
import 'package:app/app/modules/settings_moudle/binding.dart';
import 'package:app/app/modules/settings_moudle/view.dart';
import 'package:app/app/modules/start_module/binding.dart';
import 'package:app/app/modules/start_module/view.dart';
import 'package:app/app/modules/voice_assistant_module/binding.dart';
import 'package:app/app/modules/voice_assistant_module/view.dart';

import '../../app/modules/app_module/app_bindings.dart';
import '../../app/modules/app_module/app_page.dart';
import 'package:get/get.dart';

import '../modules/test_module/view.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.TEST, page: () => const OnePosition()),
    GetPage(name: Routes.APP, page: () => AppPage(), binding: AppBinding()),
    GetPage(name: Routes.START, page: () => const StartModule(), binding: StartModuleBinding()),
    GetPage(name: Routes.LOGIN, page: () => const LoginModulePage(), binding: LoginModuleBinding()),
    GetPage(name: Routes.LOGIN_PHONE, page: () => const LoginPhoneModulePage(), binding: LoginPhoneModuleBinding()),
    GetPage(name: Routes.VOICE_ASSISTANT, page: () =>  const VoiceAssistantScreen(), binding: VoiceAssistantModuleBinding()),
    GetPage(name: Routes.DEPARTURE, page: () =>  DepartureModulePage(), binding: DepartureModuleBinding()),
    GetPage(name: Routes.MINE, page: () => MineModulePage(), binding: MineModuleBinding()),
    GetPage(name: Routes.BUS, page: () => const BusModulePage(), binding: BusModuleBinding()),
    GetPage(name: Routes.BUS_LINE, page: () => const BusLineModulePage(), binding: BusLineModuleBinding(),transition: Transition.fadeIn),
    GetPage(name: Routes.FRIEND, page: () =>  FriendModulePage(), binding: FriendModuleBinding(),transition: Transition.zoom),
    GetPage(name: Routes.COUPON, page: () =>  const CouponModulePage(), binding: CouponModuleBinding(),transition: Transition.zoom),
    GetPage(name: Routes.SETTINGS, page: () => const SettingsModulePage(), binding: SettingsMoudleBinding()),
  ];
}
