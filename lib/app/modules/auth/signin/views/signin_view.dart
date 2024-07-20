import 'package:check_me_in/app/components/auth_button.dart';
import 'package:check_me_in/app/components/auth_header.dart';
import 'package:check_me_in/app/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const AuthHeader(
                      signText: 'Sign In!',
                      welcomeText:
                          'Please sign in to check in/out from your work.',
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      icon: Icons.email_rounded,
                      onSaved: (p0) {},
                      controller: controller.emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Email is empty.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      icon: Icons.lock_rounded,
                      onSaved: (p0) {},
                      controller: controller.passwordController,
                      label: 'Password',
                      keyboardType: TextInputType.emailAddress,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Password is empty.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                              onPress: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.loginUser();
                                }
                              },
                              buttonText: 'sign in'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
