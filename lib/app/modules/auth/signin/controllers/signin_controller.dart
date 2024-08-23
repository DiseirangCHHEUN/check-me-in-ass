import 'package:check_me_in/app/modules/auth/exceptions/authentication_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
 
  final TextEditingController idController =
      TextEditingController(text: 'visal@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');
 

  RxBool isLoading = false.obs;
  var error = "".obs;

  void loginUser() async {
    var id = idController.text;
    var password = passwordController.text;
    try {
      isLoading(true);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: id, password: password);
      Get.snackbar('Successful!', 'Sign in successfully.');
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(ex.title, ex.msg);
      isLoading(false);
    } catch (_) {
      const ex = AuthenticationFailure();
      Get.snackbar(ex.title, ex.msg);
      isLoading(false);
    }
  }

  void setError(String e) {
    if (e.contains(
        "RangeError (index): Invalid value: Valid value range is empty")) {
      error.value = "Employee id does not exist";
    } else {
      error.value = "Error occurred";
    }
  }
}
