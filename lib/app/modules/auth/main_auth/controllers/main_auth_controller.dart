import 'package:get/get.dart';

class MainAuthController extends GetxController {
  static MainAuthController get instance => Get.find();
  RxBool isSignIn = true.obs;

  onToggle() {
    isSignIn.value = !isSignIn.value;
  }
}
