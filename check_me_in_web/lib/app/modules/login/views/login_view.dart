import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.put(LoginController());
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/check_me_in_logo_1.jpeg'),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.xor),
              // opacity: .2,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Center(
              child: FadeTransition(
                opacity: controller.fadeAnimation!,
                child: SlideTransition(
                  position: controller.slideAnimation!,
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    width: 400,
                    // height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.yellowAccent.withOpacity(.7),
                          Colors.deepPurple.withOpacity(.5),
                          Colors.deepOrange.withOpacity(.7),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(.5),
                          blurRadius: 5,
                          // spreadRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                        BoxShadow(
                          color: Colors.yellowAccent.withOpacity(.5),
                          blurRadius: 5,
                          // spreadRadius: 2,
                          offset: const Offset(-1, -1),
                        ),
                      ],
                    ),
                    child: Form(
                      key: loginController.formKey,
                      child: Wrap(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/app_icons/100.png'),
                              ),
                              Text(
                                "Login",
                                style: GoogleFonts.anton(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                onSaved: (newValue) {},
                                obscureText: false,
                                controller: loginController.emailController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (loginController.emailController.text ==
                                      "") {
                                    return "Please enter your email.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: const Icon(Icons.person_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Obx(
                                () => TextFormField(
                                  onSaved: (newValue) {},
                                  obscureText:
                                      !loginController.isPwdVissible.value,
                                  controller: loginController.pwdController,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (loginController.pwdController.text ==
                                        "") {
                                      return "Please enter your password.";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      onPressed: () =>
                                          loginController.togglePwdVisible(),
                                      icon: Icon(
                                          loginController.isPwdVissible.value
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded),
                                    ),
                                    prefixIcon: const Icon(Icons.lock_rounded),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(
                                          backgroundColor: Colors.deepOrange,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          if (loginController
                                              .formKey.currentState!
                                              .validate()) {
                                            loginController.login();
                                          }
                                        },
                                        child: Text(
                                          'log in'.toUpperCase(),
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
