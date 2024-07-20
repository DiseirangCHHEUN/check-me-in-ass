import 'package:get/get.dart';

import '../../auth/auth_repository/auth_repository.dart';
import '../../auth/signin/controllers/signin_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<SigninController>(
      () => SigninController(),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
