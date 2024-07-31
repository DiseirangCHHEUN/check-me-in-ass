import 'package:check_me_in/app/modules/dashboard/views/dashboard_view_v2.dart';
import 'package:get/get.dart';

import '../modules/ask_permission/bindings/ask_permission_binding.dart';
import '../modules/ask_permission/views/ask_permission_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/waiting/bindings/waiting_binding.dart';
import '../modules/waiting/views/waiting_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.WAITING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardViewV2(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ASK_PERMISSION,
      page: () => const AskPermissionView(),
      binding: AskPermissionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.WAITING,
      page: () => const WaitingView(),
      binding: WaitingBinding(),
    ),
  ];
}
