import 'package:check_me_in/app/modules/auth/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

// sign in user with google
  void signInWithGoogle() {
    final controller = Get.put(AuthRepository());
    try {
      controller.signInWithGoogle();
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
