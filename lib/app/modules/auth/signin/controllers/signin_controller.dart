import 'package:check_me_in/app/modules/auth/main_auth/controllers/main_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final mainAuthController = Get.put(MainAuthController());
// sign in user with google
  void signInWithGoogle() {
    try {
      mainAuthController.signInWithGoogle();
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } catch (e) {
      Get.snackbar('Error has occurred!', e.toString());
    }
  }
}
