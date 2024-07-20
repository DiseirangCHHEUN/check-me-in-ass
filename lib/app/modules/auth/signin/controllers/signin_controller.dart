import 'package:check_me_in/app/modules/auth/exceptions/authentication_failure.dart';
import 'package:check_me_in/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController(text: 'dzrang@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'dev123456');

  void loginUser() async {
    var email = emailController.text;
    var password = passwordController.text;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.DASHBOARD);
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(ex.title, ex.msg);
    } catch (_) {
      const ex = AuthenticationFailure();
      Get.snackbar(ex.title, ex.msg);
    }
  }
}
