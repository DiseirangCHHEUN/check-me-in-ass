// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../exceptions/authentication_failure.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static LoginController get instance => Get.find();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: "dzrang@gmail.com");
  final pwdController = TextEditingController(text: "dev123456");

  RxBool isPwdVissible = false.obs;

  togglePwdVisible() {
    isPwdVissible.value = !isPwdVissible.value;
  }

  Future<void> login() async {
    var email = emailController.text;
    var password = pwdController.text;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Navigate to Home View after login success
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(ex.title, ex.msg);
      print(ex.msg);
      print(e.code);
    } catch (_) {
      const ex = AuthenticationFailure();
      print(ex.msg);
      Get.snackbar(ex.title, ex.msg);
    }
  }

  AnimationController? animationController;
  Animation<double>? fadeAnimation;
  Animation<Offset>? slideAnimation;

  void initAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInCirc,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.decelerate,
    ));

    animationController?.forward();
  }

  @override
  void onInit() {
    initAnimationController();
    super.onInit();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
