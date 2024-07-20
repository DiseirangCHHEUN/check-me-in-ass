import 'package:get/get.dart';

import '../controllers/ask_permission_controller.dart';

class AskPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskPermissionController>(
      () => AskPermissionController(),
    );
  }
}
