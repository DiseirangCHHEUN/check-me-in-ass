import 'package:check_me_in/app/modules/auth/main_auth/controllers/main_auth_controller.dart';
import 'package:check_me_in/app/modules/auth/signin/views/signin_view.dart';
import 'package:check_me_in/app/modules/auth/signup/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAuthView extends GetView<MainAuthController> {
  const MainAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isSignIn.value
          ? SigninView(onPressed: controller.onToggle)
          : SignupView(onPressed: controller.onToggle),
    );
  }
}
