import 'package:get/get.dart';

import '../controllers/main_auth_controller.dart';

class MainAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAuthController>(
      () => MainAuthController(),
    );
  }
}
