import 'package:get/get.dart';

import '../modules/auth/main_auth/bindings/main_auth_binding.dart';
import '../modules/auth/main_auth/views/main_auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.MAIN_AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_AUTH,
      page: () => const MainAuthView(),
      binding: MainAuthBinding(),
    ),
  ];
}
