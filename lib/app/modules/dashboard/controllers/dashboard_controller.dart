import 'package:check_me_in/app/modules/home/views/home_view.dart';
import 'package:check_me_in/app/modules/profile/views/profile_view.dart';
import 'package:check_me_in/app/modules/setting/views/setting_view.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  RxInt currentIndex = 0.obs;

  final List pages = [
    const HomeView(),
    const ProfileView(),
    const SettingView(),
  ];

  void onChangePageIndex(int index) {
    currentIndex.value = index;
  }
}
