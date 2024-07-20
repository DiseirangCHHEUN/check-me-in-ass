import 'package:check_me_in/app/modules/auth/auth_repository/auth_repository.dart';
import 'package:get/get.dart';

class MainAuthController extends GetxController {
  static MainAuthController get instance => Get.find();

  RxBool isSignedIn = true.obs;

  void toggleAuth() {
    isSignedIn.value = !isSignedIn.value;
  }

  @override
  void onInit() {
    Get.put(AuthRepository());
    super.onInit();
  }
}
